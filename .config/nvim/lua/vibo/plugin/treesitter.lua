return {
  'nvim-treesitter/nvim-treesitter',
  config = function()
    pcall(require('nvim-treesitter.install').update { with_sync = true })
    require('nvim-treesitter.configs').setup {
      -- Add languages to be installed here that you want installed for treesitter
      ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'typescript', 'vim' },

      auto_install = true,

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    }
    local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
    parser_config.yew = {
      install_info = {
        url = "https://github.com/tjdevries/tree-sitter-rsx",
        files = { "src/parser.c", "src/scanner.cc" },
      },
      filetype = "rs"
    }
  end
}
