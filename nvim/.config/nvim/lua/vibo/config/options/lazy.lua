vim.g.mapleader = ' '
-- Set <space> as the leader key
vim.g.maplocalleader = ' '
-- See `:help mapleader`
-- Install package manager
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup({
    -- Git related plugins
    {
        'tpope/vim-fugitive',
        config = function()
            require("vibo.config.plugins.fugitive")
        end,
        event = "VeryLazy"
    },
    'tpope/vim-rhubarb',
    {
        -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        config = function()
            pcall(require('nvim-treesitter.install').update { with_sync = true })
            require("vibo.config.plugins.treesitter")
        end,
    },
    -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',
    -- NOTE: This is where your plugins related to LSP can be installed.
    --  The configuration is done below. Search for lspconfig to find it below.
    {
        'ThePrimeagen/harpoon',
        event = "VeryLazy",
        config = function()
            require("vibo.config.plugins.harpoon")
        end,
        dependencies = {
            { 'nvim-lua/plenary.nvim' },
        },
    },
    {
        "nvim-neorg/neorg",
        ft = "norg",
        config = function()
            require("vibo.config.plugins.neorg")
        end
    },
    {
        -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            -- Additional lua configuration, makes nvim stuff amazing!
            'folke/neodev.nvim',
        },
        config = function()
            require("vibo.config.plugins.lsp")
        end
    },

    {
        -- Autocompletion
        'hrsh7th/nvim-cmp',
        dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
    },
    {
        -- Adds git releated signs to the gutter, as well as utilities for managing changes
        'lewis6991/gitsigns.nvim',
        config = function()
            require("vibo.config.plugins.gitsigns")
        end
    },

    {
        "vibovenkat123/rgpt.nvim",
        cmd = "ReviewGPT"
    },

    {
        -- The best theme
        'rose-pine/neovim',
        name = 'rose-pine',
        priority = 1000,
        config = function()
            vim.cmd.colorscheme('rose-pine')

            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        end,
    },

    -- Fuzzy Finder (files, lsp, etc)

    -- Fuzzy Finder Algorithm which requires local dependencies to be built.
    -- Only load if `make` is available. Make sure you have the system
    -- requirements installed.
    {
        'ibhagwan/fzf-lua',
        config = function()
            require("vibo.config.plugins.fzf")
        end,
        event = "VeryLazy"
    },
    { import = "vibo.plugins" }
}, {})
