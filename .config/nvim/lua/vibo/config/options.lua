local opt = vim.opt
opt.guicursor = ""
-- numbers
opt.nu = true
opt.relativenumber = true
-- tabs
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.cindent = true
opt.breakindent = true
vim.opt.showbreak = string.rep(" ", 3) -- Make it so that long lines wrap smartly
opt.linebreak = true

-- cache
opt.wildignore = "__pycache__"
opt.wildignore:append { "*.o", "*~", "*.pyc", "*pycache*" }
opt.wildignore:append { "Cargo.lock", "Cargo.Bazel.lock" }

-- Cool floating window popup menu for completion on command line (tjdevries)
opt.pumblend = 17
opt.wildmode = "longest:full"
opt.wildoptions = "pum"

-- swap files, etc.
opt.wrap = false
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.swapfile = false
opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 50
opt.colorcolumn = "80"
