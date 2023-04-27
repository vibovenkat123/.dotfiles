return {
  "catppuccin/nvim",
  name = "catppuccin",
  setup = {
    transparent_background = true,
    background = {
      light = "latte",
      dark = "macchiato",
    },
  },
  priority = 1000,
  config = function()
    vim.opt.background = "dark"
    vim.cmd.colorscheme("catppuccin")
--    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  end
}
