require('onedark').setup {
    transparent = true
}
require('rose-pine').setup({
    disable_background = true
})
function Color(color)
    vim.g.gruvbox_contrast_dark = 'hard'
    vim.g.gruvbox_invert_selection = '0'
    vim.opt.background = 'dark'
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end
Color('onedark')
