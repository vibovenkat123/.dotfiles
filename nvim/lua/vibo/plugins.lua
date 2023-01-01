vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'christoomey/vim-tmux-navigator'
  use("szw/vim-maximizer") 
  use 'evanleck/vim-svelte'
  use 'pantharshit00/vim-prisma'
  use 'nvim-lua/plenary.nvim'
  use("nvim-lua/popup.nvim")
  use("neovim/nvim-lspconfig")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/nvim-cmp")
  use("onsails/lspkind-nvim")
  use("nvim-lua/lsp_extensions.nvim")
  use("glepnir/lspsaga.nvim")
  use("simrat39/symbols-outline.nvim")
  use("L3MON4D3/LuaSnip")
  use("saadparwaiz1/cmp_luasnip")
  use("ThePrimeagen/refactoring.nvim")
  use({ 'rose-pine/neovim', as = 'rose-pine' })
  use { "catppuccin/nvim", as = "catppuccin" }
  use("nvim-treesitter/nvim-treesitter", {
    run = ":TSUpdate"
  })
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use("nvim-treesitter/playground")
  use("romgrk/nvim-treesitter-context")
  use("mfussenegger/nvim-dap")
  use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
  use("rcarriga/nvim-dap-ui")
  use("theHamsta/nvim-dap-virtual-text")
  use 'nvim-telescope/telescope.nvim'
  use 'RRethy/nvim-base16'
  use("scrooloose/nerdtree")
  use("ryanoasis/vim-devicons")
  use 'gruvbox-community/gruvbox'
  use 'folke/tokyonight.nvim'
end)
