vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'christoomey/vim-tmux-navigator'
  use("szw/vim-maximizer") 
  use {
    'neoclide/coc.nvim',
    branch = 'release'
  }
  use 'pantharshit00/vim-prisma'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'RRethy/nvim-base16'
  use("scrooloose/nerdtree")
  use("ryanoasis/vim-devicons")
  use 'gruvbox-community/gruvbox'
end)
