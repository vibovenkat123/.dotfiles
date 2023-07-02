return {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
        flavour = "mocha",  -- latte, frappe, macchiato, mocha
        term_colors = true,
        transparent_background = true,
        no_italic = false,
        no_bold = false,
        styles = {
            comments = {},
            conditionals = {},
            loops = {},
            functions = {},
            keywords = {},
            strings = {},
            variables = {},
            numbers = {},
            booleans = {},
            properties = {},
            types = {},
        },
        color_overrides = {
            mocha = {
                base = "#000000",
                mantle = "#000000",
                crust = "#000000",
            },
        },
        highlight_overrides = {
            mocha = function(C)
                return {
                    TabLineSel = { bg = C.pink },
                    CmpBorder = { fg = C.surface2 },
                    Pmenu = { bg = C.none },
                    TelescopeBorder = { link = "FloatBorder" },
                }
            end,
        },
    },
    config = function()
        vim.cmd.colorscheme("catppuccin")
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end
}
