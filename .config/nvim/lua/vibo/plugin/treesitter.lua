return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = { "nvim-treesitter/playground" },
    config = function()
        pcall(require('nvim-treesitter.install').update { with_sync = true })
        require('nvim-treesitter.configs').setup {
            playground = {
                enable = true,
                disable = {},
                updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
                persist_queries = false, -- Whether the query persists across vim sessions
                keybindings = {
                    toggle_query_editor = 'o',
                    toggle_hl_groups = 'i',
                    toggle_injected_languages = 't',
                    toggle_anonymous_nodes = 'a',
                    toggle_language_display = 'I',
                    focus_language = 'f',
                    unfocus_language = 'F',
                    update = 'R',
                    goto_node = '<cr>',
                    show_help = '?',
                },
            },
            -- Add languages to be installed here that you want installed for treesitter
            ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'typescript', 'vim' },

            auto_install = true,

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        }
        local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
        parser_config.yew = {
            install_info = {
                url = "https://github.com/tjdevries/tree-sitter-rsx",
                files = { "src/parser.c", "src/scanner.cc" },
            },
            filetype = "rs"
        }
    end
}
