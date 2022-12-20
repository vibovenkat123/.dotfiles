vim.g.colorscheme_vibo = "rose-pine"
require("rose-pine").setup({
   disable_background = true
})
function color()
  vim.g.gruvbox_contrast_dark = "hard"
  vim.g.gruvbox_invert_selection = "0"
  vim.opt.background = 'dark'
  vim.cmd("colorscheme " .. vim.g.colorscheme_vibo)
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end
color()
