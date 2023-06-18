return {
    dir = "~/projects/zen.lua",
    dependencies = { "rktjmp/lush.nvim" },
    config = function()
        vim.cmd.colorscheme("zen")
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end
}
