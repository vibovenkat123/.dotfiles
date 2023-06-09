return {
    "mcchrish/zenbones.nvim",
    priority = 1000,
    dependencies = {
        { "rktjmp/lush.nvim" }
    },
    config = function()
        vim.cmd.colorscheme("zenbones")
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end
}

