return {
  'nvim-telescope/telescope.nvim',
  version = '*',
  dependencies = { 'nvim-lua/plenary.nvim' },
  cmd = "Telescope",
  keys = {
    {'<leader>sf', "<cmd>Telescope find_files<CR>"},
    {'<leader>sh', "<cmd>Telescope help_tags<CR>"},
    {'<leader>sw', "<cmd>Telescope grep_string<CR>"},
    {'<leader>sg', "<cmd>Telescope live_grep<CR>"},
    {'<leader>sd', "<cmd>Telescope diagnostics<CR>"},
    {'<leader>?', "<cmd>Telescope oldfiles<CR>"},
    {'<leader><space>', "<cmd>Telescope buffers<CR>"},
  },
  config = function()
    require("telescope").setup {

      pickers = {
        -- see hidden files
        find_files = {
          find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden' },
        },
      },
      defaults = {
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
          },
        },
      },
    }
    -- Enable telescope fzf native, if installed
    pcall(require('telescope').load_extension, 'fzf')
  end
}
