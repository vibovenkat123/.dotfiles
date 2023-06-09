return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function()
    local augroup = vim.api.nvim_create_augroup("FormattingLSP", {})
    local null_ls = require("null-ls")
    local op = {
      debounce = 150,
      save_after_format = false,
      sources = {
        null_ls.builtins.diagnostics.pylint,
        null_ls.builtins.formatting.black,
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr })
            end
          })
        end
      end
    }
    return op
  end
}
