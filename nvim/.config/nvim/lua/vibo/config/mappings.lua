local nmap = require("util.keymap").nmap
-- launch netrw
nmap {"<leader>sv", vim.cmd.Ex}

-- move lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

nmap {"J", "mzJ`z"}
nmap {"<C-d>", "<C-d>zz"}
nmap {"<C-u>", "<C-u>zz"}
nmap {"n", "nzzzv"}
nmap {"N", "Nzzzv"}


-- copy to clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
nmap {"<leader>Y", [["+Y]]}

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])


nmap {"Q", "<nop>"}

-- open tmux sessions
nmap {"<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>"}

nmap {"<leader>f", vim.lsp.buf.format}

-- notes
nmap {"<leader>pn", "<cmd>silent !noteneovim<CR>"}
nmap {"<leader>pm", string.format("<cmd>silent !compilemd %s<CR>", vim.fn.expand('%:p'))}

-- center on movement
nmap {"<C-k>", "<cmd>cnext<CR>zz"}
nmap {"<C-j>", "<cmd>cprev<CR>zz"}
nmap {"<leader>k", "<cmd>lnext<CR>zz"}
nmap {"<leader>j", "<cmd>lprev<CR>zz"}

-- set executable
nmap {"<leader>x", "<cmd>!chmod +x %<CR>", { silent = true }}

-- edit lazy.lua
nmap {"<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/vibo/config/lazy.lua<CR>"};
