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

require('lazy').setup({
    -- tabs or spaces?
    'tpope/vim-sleuth',
    -- best plugin
    {
        dir = "~/projects/rgpt.nvim",
        cmd = "ReviewGPT"
    },
    {
        'sainnhe/everforest',
        priority = 1000,
        opts = {
            disable_background = true,
        },
        config = function()
            vim.g.everforest_transparent_background = 2
            vim.g.everforest_background = 'dark'
            vim.g.everforest_better_performance = 1
            vim.cmd.colorscheme("everforest")
            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        end,
    },
    -- context
    {
        'nvim-treesitter/nvim-treesitter-context',
    },
    -- playground
    {
        "nvim-treesitter/playground",
    },
    --undos
    {
        'mbbill/undotree',
        config = function()
            require("vibo.plugin.undotree")
        end
    },
    -- for finding files
    {
        'nvim-telescope/telescope.nvim',
        version = '*',
        event = "VeryLazy",
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require("vibo.plugin.telescope")
        end
    },
    -- to make telescope faster
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
            return vim.fn.executable 'make' == 1
        end,
    },
    -- to see all my errors :)
    {
        "folke/trouble.nvim",
        opts = {
            icons = false,
        },
    },
    -- navigate better
    {
        "theprimeagen/harpoon",
        config = function()
            require("vibo.plugin.harpoon")
        end
    },
    -- so neovim looks good
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        config = function()
            pcall(require('nvim-treesitter.install').update { with_sync = true })
            require("vibo.plugin.treesitter")
            require("vibo.plugin.sql_format")
        end,
    },
    -- to refactor
    {
        "theprimeagen/refactoring.nvim",
        event = "VeryLazy",
        config = function()
            require("vibo.plugin.refactoring")
        end,
    },
    {
        -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            -- Useful status updates for LSP
            -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
            { 'j-hui/fidget.nvim', opts = {} },

            -- Additional lua configuration, makes nvim stuff amazing!
            'folke/neodev.nvim',
        },
    },

    {
        -- Autocompletion
        'hrsh7th/nvim-cmp',
        dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
        event = "InsertEnter",
        config = function()
            require("vibo.plugin.cmp")
        end,
    },
    -- go in the zennnnn :D,
    {
        "folke/zen-mode.nvim",
        opts = {}
    },
    -- git gud
    {
        "tpope/vim-fugitive",
        config = function()
            require("vibo.plugin.fugitive")
        end
    },
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            { "leoluz/nvim-dap-go" },
            { "rcarriga/nvim-dap-ui" },
        },
        config = function()
            require("vibo.plugin.dap")
        end,
    },
})
