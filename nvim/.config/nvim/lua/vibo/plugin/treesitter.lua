require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'typescript', 'help', 'vim' },

  auto_install = true,

  highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
  },
}
