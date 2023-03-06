local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
local safe_load = require("vibo.utils").safe_load
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
      'rose-pine/neovim',
      name = 'rose-pine',
      lazy=false,
      priority=1000,
  },
  {
      'catppuccin/nvim',
      name = 'catppuccin',
      lazy=false,
      priority=1000,
  },
  "simrat39/rust-tools.nvim",
  {
      'arcticicestudio/nord-vim',
      lazy=false,
      priority=1000,
  },
  {
	  'nvim-telescope/telescope.nvim', version = '0.1.0',
	  dependencies = { {'nvim-lua/plenary.nvim'} },
      config = function() 
          safe_load "vibo.plugin_configs.telescope"
      end
  },
  { 
      dir = '~/projects/rgpt.nvim',
      config = function() 
          safe_load 'vibo.plugin_configs.rgpt'
      end
  },
  {
      'lewis6991/gitsigns.nvim',
      config = function()
          safe_load 'vibo.plugin_configs.gitsigns'
      end
  },
  {
      'tpope/vim-fugitive',
      config = function()
          safe_load 'vibo.plugin_configs.dap'
      end
  },
   'folke/tokyonight.nvim',
   {
       'mfussenegger/nvim-dap',
        config = function()
          safe_load 'vibo.plugin_configs.dap'
        end
   },
   'leoluz/nvim-dap-go',
   'rcarriga/nvim-dap-ui',
   'theHamsta/nvim-dap-virtual-text',
   'nvim-telescope/telescope-dap.nvim',
  {
      'nvim-treesitter/nvim-treesitter', build = ':TSUpdate',
      config = function() 
          safe_load "vibo.plugin_configs.treesitter"
      end
  },
  'nvim-treesitter/playground',
  {
      'theprimeagen/harpoon',
      config = function() 
          safe_load "vibo.plugin_configs.navigate"
      end
  },
  {
    'xbase-lab/xbase',
    build = 'make install',
    dependencies = {
        { "nvim-lua/plenary.nvim"},
        {"nvim-telescope/telescope.nvim"},
        {"neovim/nvim-lspconfig"}
    },
    config = function()
      require'xbase'.setup({})  -- see default configuration bellow
    end
  },
   {
	  'VonHeikemen/lsp-zero.nvim',
	  dependencies = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
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
          config = function() 
              safe_load "vibo.plugin_configs.lsp"
          end
	  },
}
})
