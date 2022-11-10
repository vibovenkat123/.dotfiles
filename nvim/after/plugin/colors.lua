vim.g.colorscheme_vibo = "gruvbox"
function color()
  vim.g.gruvbox_contrast_dark = "hard"
  vim.g.gruvbox_invert_selection = "0"
  vim.opt.background = 'dark'
  vim.cmd("colorscheme " .. vim.g.colorscheme_vibo)
end
color()
