local nmap = require("util.keymap").nmap
return {
  "nvim-tree/nvim-tree.lua",
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    require("nvim-tree").setup()
    nmap {"<leader>sv", "<cmd>NvimTreeToggle<CR>"}
  end,
}
