local colors = require("colorbuddy.color").colors

local ns_vibo = vim.api.nvim_create_namespace "vibo_colors"
local ns_vibo_2 = vim.api.nvim_create_namespace "vibo_colors_2"

vim.api.nvim_set_decoration_provider(ns_vibo, {
  on_start = function(_, tick)
  end,

  on_buf = function(_, bufnr, tick)
  end,

  on_win = function(_, winid, bufnr, topline, botline)
  end,

  on_line = function(_, winid, bufnr, row)
    if row == 10 then
      vim.api.nvim_set_hl_ns(ns_vibo_2)
    else
      vim.api.nvim_set_hl_ns(ns_vibo)
    end
  end,

  on_end = function(_, tick)
  end,
})

vim.api.nvim_set_hl(ns_vibo, "LuaFunctionCall", {
  foreground = colors.green:to_rgb(),
  background = nil,
  reverse = false,
  underline = false,
})

vim.api.nvim_set_hl_ns(ns_vibo)
if not pcall(require, "colorbuddy") then
  return
end

vim.opt.termguicolors = true


require("colorbuddy").colorscheme "gruvbuddy"
require("colorizer").setup()

local c = require("colorbuddy.color").colors
local Group = require("colorbuddy.group").Group
local g = require("colorbuddy.group").groups
local s = require("colorbuddy.style").styles

Group.new("@variable", c.superwhite, nil)

Group.new("GoTestSuccess", c.green, nil, s.bold)
Group.new("GoTestFail", c.red, nil, s.bold)

-- Group.new('Keyword', c.purple, nil, nil)

Group.new("TSPunctBracket", c.orange:light():light())

Group.new("StatuslineError1", c.red:light():light(), g.Statusline)
Group.new("StatuslineError2", c.red:light(), g.Statusline)
Group.new("StatuslineError3", c.red, g.Statusline)
Group.new("StatuslineError3", c.red:dark(), g.Statusline)
Group.new("StatuslineError3", c.red:dark():dark(), g.Statusline)

Group.new("pythonTSType", c.red)
Group.new("goTSType", g.Type.fg:dark(), nil, g.Type)

Group.new("typescriptTSConstructor", g.pythonTSType)
Group.new("typescriptTSProperty", c.blue)

-- vim.cmd [[highlight WinSeparator guifg=#4e545c guibg=None]]
Group.new("WinSeparator", nil, nil)

-- I don't think I like highlights for text
-- Group.new("LspReferenceText", nil, c.gray0:light(), s.bold)
-- Group.new("LspReferenceWrite", nil, c.gray0:light())

-- Group.new("TSKeyword", c.purple, nil, s.underline, c.blue)
-- Group.new("LuaFunctionCall", c.green, nil, s.underline + s.nocombine, g.TSKeyword.guisp)

Group.new("TSTitle", c.blue)

-- TODO: It would be nice if we could only highlight
-- the text with characters or something like that...
-- but we'll have to stick to that for later.
Group.new("InjectedLanguage", nil, g.Normal.bg:dark())

Group.new("LspParameter", nil, nil, s.italic)
Group.new("LspDeprecated", nil, nil, s.strikethrough)
Group.new("@function.bracket", g.Normal, g.Normal)
Group.new("@variable.builtin", c.purple:light():light(), g.Normal)

-- Group.new("VirtNonText", c.yellow:light():light(), nil, s.italic)
Group.new("VirtNonText", c.gray3:dark(), nil, s.italic)

-- Group.new("@function.call.lua"
vim.cmd [[highlight link @function.call.lua LuaFunctionCall]]
vim.cmd [[
  hi link @lsp.type.variable.ocaml variable
  hi link @lsp.type.namespace @namespace
]]
