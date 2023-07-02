return {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
        close_if_last_window = true,         -- Close Neo-tree if it is the last window left in the tab
        default_component_configs = {
            icon = {
                folder_closed = ">",
                folder_open = "v",
                folder_empty = "ﰊ",
                default = "*",
                highlight = "NeoTreeFileIcon"
            },
            modified = {
                symbol = "[+]",
                highlight = "NeoTreeModified",
            },
            git_status = {
                symbols = {
                    -- Change type
                    added     = "+", -- or "✚", but this is redundant info if you use git_status_colors on the name
                    modified  = "M", -- or "", but this is redundant info if you use git_status_colors on the name
                    deleted   = "x", -- this can only be used in the git_status source
                    renamed   = "R", -- this can only be used in the git_status source
                    -- Status type
                    untracked = "*",
                    ignored   = "I",
                    unstaged  = "U",
                    staged    = "S",
                    conflict  = "C",
                }
            },
        },
    },
    keys = {
        { '<leader>tc', "<cmd>Neotree reveal toggle<CR>" },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
    }
}
