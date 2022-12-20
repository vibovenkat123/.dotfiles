
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use({
    'rose-pine/neovim',
    as = 'rose-pine',
  })
  use("szw/vim-maximizer") 
  use 'evanleck/vim-svelte'
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use 'pantharshit00/vim-prisma'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use("scrooloose/nerdtree")
  use("ryanoasis/vim-devicons")
  use 'gruvbox-community/gruvbox'
  lsp.on_attach(function(client, bufnr)
      local opts = {buffer = bufnr, remap = false}

        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
          vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
            vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
              vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
                vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
                  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
                    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
                      vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
                        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
                          vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
                        end)
  use("ThePrimeagen/harpoon")
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},
      {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }
end)
