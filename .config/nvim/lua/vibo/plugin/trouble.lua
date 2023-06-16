local nmap = require("util.keymap").nmap
return {
  "folke/trouble.nvim",
  opts = {
    icons = false,
  },
  config = function()
    nmap({"<leader>xx", "<cmd>TroubleToggle<cr>"})
  end
}
