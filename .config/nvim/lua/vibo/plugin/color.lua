return {
  "sainnhe/everforest",
  priority = 1000,
  config = function()
    vim.g.everforest_transparent_background = 2
    vim.g.everforest_background = 'hard'
    vim.g.everforest_better_performance = 1
    vim.cmd.colorscheme("everforest")
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  end
}
