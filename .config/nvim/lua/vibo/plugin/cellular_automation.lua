return {
  -- the greatest
  "Eandrju/cellular-automaton.nvim",
  config = function()
    vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")
  end
}

