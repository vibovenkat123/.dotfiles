-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
-- Enable telescope fzf native, if installed
local fzf = require('fzf-lua')
-- See `:help telescope.builtin`
-- You can pass additional configuration to telescope to change theme, layout, etc.
vim.keymap.set('n', '<leader>sf', fzf.files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<C-p>', fzf.git_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', fzf.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', fzf.grep, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', fzf.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sc', fzf.git_commits, { desc = '[S]earch [C]ommits' })
