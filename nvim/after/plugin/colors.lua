vim.g.colorscheme_vibo = "base16-onedark"
function color()
  vim.opt.background = 'dark'
  vim.cmd("colorscheme " .. vim.g.colorscheme_vibo)
end
color()
