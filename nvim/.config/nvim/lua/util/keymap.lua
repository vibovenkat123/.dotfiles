local M = {}
local map = function(mode, t)
    vim.keymap.set(mode, t[1], t[2], t[3])
end

M.nmap = function(t)
    map("n", t)
end

M.imap = function(t)
    map("i", t)
end

return M
