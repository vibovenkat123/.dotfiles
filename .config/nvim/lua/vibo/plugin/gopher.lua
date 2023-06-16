return {
  "olexsmir/gopher.nvim",
  ft = "go",
  config = function()
    require("gopher").setup(opts)
  end,
  build = function()
    vim.cmd[[silent! GoInstallDeps]]
  end
}
