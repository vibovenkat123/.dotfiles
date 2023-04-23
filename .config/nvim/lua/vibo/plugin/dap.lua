return {
  "mfussenegger/nvim-dap",
  dependencies = {
    { "leoluz/nvim-dap-go" },
    { "rcarriga/nvim-dap-ui" },
  },
  event = "VeryLazy",
  config = function()
    local dap = require("dap")
    vim.fn.sign_define("DapBreakpoint", { text = "⬢", texthl = "Yellow", linehl = "", numhl = "Yellow" })
    vim.fn.sign_define("DapStopped", { text = "▶", texthl = "Green", linehl = "ColorColumn", numhl = "Green" })

    dap.adapters.go = function(callback, _)
      local stdout = vim.loop.new_pipe(false)
      local handle, pid_or_err
      local port = 38697

      handle, pid_or_err = vim.loop.spawn("dlv", {
        stdio = { nil, stdout },
        args = { "dap", "-l", "127.0.0.1:" .. port },
        detached = true,
      }, function(code)
        if stdout ~= nil then
          stdout:close()
        end
        if handle ~= nil then
          handle:close()
        end

        print("[delve] Exit Code:", code)
      end)

      assert(handle, "Error running dlv: " .. tostring(pid_or_err))
      if stdout ~= nil then
        stdout:read_start(function(err, chunk)
          assert(not err, err)

          if chunk then
            vim.schedule(function()
              require("dap.repl").append(chunk)
              print("[delve]", chunk)
            end)
          end
        end)
      end
      -- Wait for delve to start
      vim.defer_fn(function()
        callback { type = "server", host = "127.0.0.1", port = port }
      end, 100)
    end

    dap.configurations.go = {
      {
        type = "go",
        name = "Debug",
        request = "launch",
        program = "${file}",
        showLog = true,
      },
      {
        name = "Test Current File",
        type = "go",
        request = "launch",
        showLog = true,
        mode = "test",
        program = ".",
        dlvToolPath = vim.fn.exepath "dlv",
      },
    }

    local map = function(lhs, rhs, desc)
      if desc then
        desc = "[DAP] " .. desc
      end

      vim.keymap.set("n", lhs, rhs, { silent = true, desc = desc })
    end

    map("<leader>d1", require("dap").step_back, "step_back")
    map("<leader>d2", require("dap").step_into, "step_into")
    map("<leader>d3", require("dap").step_over, "step_over")
    map("<leader>d4", require("dap").step_out, "step_out")
    map("<leader>d5", require("dap").continue, "continue")

    map("<leader>dr", require("dap").repl.open)

    map("<leader>db", require("dap").toggle_breakpoint)
    map("<leader>dB", function()
      require("dap").set_breakpoint(vim.fn.input "[DAP] Condition > ")
    end)

    map("<leader>de", require("dapui").eval)

    vim.cmd [[
augroup DapRepl
  au!
  au FileType dap-repl lua require('dap.ext.autocompl').attach()
augroup END
]]

    local dap_ui = require "dapui"
    local _ = dap_ui.setup {
      layouts = {
        {
          elements = {
            "scopes",
            "breakpoints",
            "stacks",
            "watches",
          },
          size = 40,
          position = "left",
        },
        {
          elements = {
            "repl",
            "console",
          },
          size = 10,
          position = "bottom",
        },
      },
      -- -- You can change the order of elements in the sidebar
      -- sidebar = {
      --   elements = {
      --     -- Provide as ID strings or tables with "id" and "size" keys
      --     {
      --       id = "scopes",
      --       size = 0.75, -- Can be float or integer > 1
      --     },
      --     { id = "watches", size = 00.25 },
      --   },
      --   size = 50,
      --   position = "left", -- Can be "left" or "right"
      -- },
      --
      -- tray = {
      --   elements = {},
      --   size = 15,
      --   position = "bottom", -- Can be "bottom" or "top"
      -- },
    }

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dap_ui.open()
    end

    dap.listeners.before.event_terminated["dapui_config"] = function()
      dap_ui.close()
    end

    dap.listeners.before.event_exited["dapui_config"] = function()
      dap_ui.close()
    end

    local ok, dap_go = pcall(require, "dap-go")
    if ok then
      dap_go.setup()
      map("<leader>dt", dap_go.debug_test, "debug_test")
    end
  end
}
