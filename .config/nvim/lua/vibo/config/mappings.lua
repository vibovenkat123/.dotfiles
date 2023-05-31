local nmap = require("util.keymap").nmap

-- move lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

nmap { "J", "mzJ`z" }
nmap { "<C-d>", "<C-d>zz" }
nmap { "<C-u>", "<C-u>zz" }
nmap { "n", "nzzzv" }
nmap { "N", "Nzzzv" }

function ClearScreen()
    local opt = vim.opt
    opt.nu = not opt.nu:get()
    -- togle status bar
    if opt.laststatus:get() == 0 then
        opt.laststatus = 2
    else
        opt.laststatus = 0
    end
    if ColorColOn then
        opt.colorcolumn = "1"
        vim.cmd("!tmux set -g status off")
        ColorColOn = false
    else
        vim.cmd("!tmux set -g status on")
        opt.colorcolumn = "80"
        ColorColOn = true
    end
    opt.rnu = not opt.rnu:get()
    opt.showmode = not opt.showmode:get()
    opt.showcmd = not opt.showcmd:get()
    opt.hidden = not opt.hidden:get()
    opt.ruler = not opt.ruler:get()
    opt.list = not opt.list:get()
    if opt.listchars:get() == { tab = "» ", eol = "↲", trail = "·", extends = "…", precedes = "…" } then
        opt.listchars = {}
    else
        opt.listchars = { tab = "» ", eol = "↲", trail = "·", extends = "…", precedes = "…" }
    end
    vim.cmd("NvimTreeClose")
end

-- copy to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
nmap { "<leader>Y", [["+Y]] }
nmap { "<F5>", "<cmd>lua ClearScreen()<CR>" }
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])


nmap {"<Left>", "<cmd>silent bp<CR>"}
nmap {"<Right>", "<cmd>silent bn<CR>"}
nmap { "Q", "<nop>" }

-- open tmux sessions
nmap { "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>" }

nmap { "<leader>f", vim.lsp.buf.format }

-- notes
nmap { "<leader>pn", "<cmd>silent !noteneovim<CR>" }
nmap { "<leader>pm", string.format("<cmd>silent !compilemd %s<CR>", vim.fn.expand('%:p')) }

-- center on movement
nmap { "<C-k>", "<cmd>cnext<CR>zz" }
nmap { "<C-j>", "<cmd>cprev<CR>zz" }
nmap { "<leader>k", "<cmd>lnext<CR>zz" }
nmap { "<leader>j", "<cmd>lprev<CR>zz" }

-- set executable
nmap { "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true } }

-- edit lazy.lua
nmap { "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/vibo/config/lazy.lua<CR>" };

-- ascii
nmap {"<leader>as", "<cmd>.!toilet -w 200 -f small<CR>"}
nmap {"<leader>aa", "<cmd>.!toilet -w 200 -f standard<CR>"}
-- box
nmap {"<leader>al", "<cmd>.!toilet -w 200 -f term -F border<CR>"}

