local nmap = require("util.keymap").nmap
return {
    "tpope/vim-fugitive",
    config = function()
        nmap {"<leader>gs", "<cmd>Git<CR>"}
        nmap {"<leader>gc", "<cmd>Git commit<CR>"}
        nmap {"<leader>p", "<cmd>Git push<CR>"}
    end
}
