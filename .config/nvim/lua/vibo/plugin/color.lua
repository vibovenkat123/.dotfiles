return {
  "folke/tokyonight.nvim",
  name = "tokyonight",
  priority = 1000,
  opts = {
    style = "night",
    transparent = true,
  },
  config = function()
    vim.cmd.colorscheme("tokyonight")
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  end
}
