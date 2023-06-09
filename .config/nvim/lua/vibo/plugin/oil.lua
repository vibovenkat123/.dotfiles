local nmap = require("util.keymap").nmap
return {
  "stevearc/oil.nvim",
  config = function()
    nmap { "<leader>sv", "<cmd>Oil<cr>" }
    require("oil").setup()
  end
}
