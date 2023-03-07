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
      'gruvbox-community/gruvbox',
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
          require("vibo.plugins.telescope")
      end
  },
  {
      dir = '~/projects/rgpt.nvim',
      config = function()
          require('vibo.plugins.rgpt')
      end
  },
  {
      'lewis6991/gitsigns.nvim',
      config = function()
          require('vibo.plugins.gitsigns')
      end
  },
  {
      'tpope/vim-fugitive',
      config = function()
          require('vibo.plugins.fugitive')
      end
  },
   'folke/tokyonight.nvim',
   {
       'mfussenegger/nvim-dap',
        config = function()
          require('vibo.plugins.dap')
        end
   },
   'leoluz/nvim-dap-go',
   'rcarriga/nvim-dap-ui',
   'theHamsta/nvim-dap-virtual-text',
   'nvim-telescope/telescope-dap.nvim',
  {
      'nvim-treesitter/nvim-treesitter', build = ':TSUpdate',
      config = function()
          require("vibo.plugins.treesitter")
      end
  },
  'nvim-treesitter/playground',
  {
      'theprimeagen/harpoon',
      config = function()
          require("vibo.plugins.harpoon")
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
      require('xbase').setup({})
    end
  },
   {
	  'VonHeikemen/lsp-zero.nvim',
	  dependencies = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {
              'williamboman/mason.nvim',
              config = function()
                  require("vibo.plugins.lsp")
              end
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
          config = function()
              require("vibo.plugins.lsp")
          end
	  },
}
})
