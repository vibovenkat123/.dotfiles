local nmap = require("util.keymap").nmap
return {
    "stevearc/oil.nvim",
    config = function()
        require("oil").setup()
        nmap {"<leader>as", "<cmd>Oil<cr>"}
    end,
}
