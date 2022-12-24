-- Set highlight on search
vim.o.hlsearch = false
vim.wo.rnu = true
-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'
vim.opt.guicursor = ""
-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'
vim.g.colorscheme_vibo = "tokyonight"
vim.cmd("colorscheme " .. vim.g.colorscheme_vibo)
-- Set colorscheme
vim.o.termguicolors = true
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'
