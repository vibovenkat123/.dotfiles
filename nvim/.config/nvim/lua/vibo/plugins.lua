require('vibo.keymaps')
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
  {
      'arcticicestudio/nord-vim',
      lazy=false,
      priority=1000,
  },
  {
	  'nvim-telescope/telescope.nvim', version = '0.1.0',
	  dependencies = { {'nvim-lua/plenary.nvim'} }
  },
  { dir = '~/projects/rgpt.nvim'},
  'lewis6991/gitsigns.nvim',
  'tpope/vim-fugitive',
   'folke/tokyonight.nvim',
   'mfussenegger/nvim-dap',
   'leoluz/nvim-dap-go',
   'rcarriga/nvim-dap-ui',
   'theHamsta/nvim-dap-virtual-text',
   'nvim-telescope/telescope-dap.nvim',
  {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
  'nvim-treesitter/playground',
  'theprimeagen/harpoon',
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
	  },
}
})
