local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
return require('lazy').setup({
    {
        'folke/tokyonight.nvim',
        lazy=false,
        priority=1000,
    },
    {
        "folke/noice.nvim",
        config = function() 
            require("noice").setup({
                lsp = {
                    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true,
                    },
                },
                -- you can enable a preset for easier configuration
                presets = {
                    bottom_search = true, -- use a classic bottom cmdline for search
                    command_palette = true, -- position the cmdline and popupmenu together
                    long_message_to_split = true, -- long messages will be sent to a split
                    inc_rename = false, -- enables an input dialog for inc-rename.nvim
                    lsp_doc_border = false, -- add a border to hover docs and signature help
                },
            })
        end,
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        }
    },
    {
        "simrat39/rust-tools.nvim",
        ft = "rs",
        event = "VeryLazy"
    },
    {
        'nvim-telescope/telescope.nvim', version = '0.1.0',
        dependencies = { {'nvim-lua/plenary.nvim'} },
        config = function()
            require("vibo.plugins.telescope")
        end,
        event = "VeryLazy"
    },
    {
        dir = '~/projects/rgpt.nvim',
        config = function()
            require('vibo.plugins.rgpt')
        end,
        event = "VeryLazy"
    },
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('vibo.plugins.gitsigns')
        end
    },
    {
        "nvim-neorg/neorg",
        ft = "norg",
        build = ":Neorg sync-parsers",
        opts = {
            load = {
                ["core.defaults"] = {}, -- Loads default behaviour
                ["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
                ["core.norg.dirman"] = { -- Manages Neorg workspaces
                config = {
                    workspaces = {
                        work = "~/work/notes",
                        personal = "~/personal/notes",
                    },
                },
            },
        },
    },
    dependencies = { { "nvim-lua/plenary.nvim" } },
},
{
    "folke/trouble.nvim",
    config = function()
        require("trouble").setup {
            -- your configuration comes here
            icons = false,
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    end
},
{
    'tpope/vim-fugitive',
    config = function()
        require('vibo.plugins.fugitive')
    end,
    event = "VeryLazy"
},
{
    'mfussenegger/nvim-dap',
    config = function()
        require('vibo.plugins.dap')
    end,
    event = "VeryLazy"
},
{
    'leoluz/nvim-dap-go',
    event = "VeryLazy"
},
{
    'rcarriga/nvim-dap-ui',
    event = "VeryLazy"
},
{
    'theHamsta/nvim-dap-virtual-text',
    event = "VeryLazy"
},
{
    event = "VeryLazy",
    'nvim-telescope/telescope-dap.nvim',
},
{
    'nvim-treesitter/nvim-treesitter', build = ':TSUpdate',
    config = function()
        require("vibo.plugins.treesitter")
    end
},
{
    'theprimeagen/harpoon',
    config = function()
        require("vibo.plugins.harpoon")
    end,
    event = "VeryLazy"
},
{
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},
        {
            'williamboman/mason.nvim',
        },
        {'williamboman/mason-lspconfig.nvim'},

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-path'},
        {'saadparwaiz1/cmp_luasnip'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/cmp-nvim-lua'},

        -- Snippets
        {'L3MON4D3/LuaSnip'},
        {'rafamadriz/friendly-snippets'},
    }
}
})
