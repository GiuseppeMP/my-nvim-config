local tokyo_colors = require("tokyonight.colors").setup()
local util = require("tokyonight.util")
local M = {}

M.util = util
M.tokyo_colors = tokyo_colors
M.colors = {}

M.colors = tokyo_colors
-- M.colors.b_green = '#98f3a1'
-- M.colors.green = '#bee5b0'
M.colors.green = '#b1ce92'
M.colors.b_green = '#bee5b0'
M.colors.purple = '#a198f3'
M.colors.magenta = '#a198f3'
M.colors.moca = '#291c17'
M.colors.b_yellow = '#FCDC94'
M.colors.bg = '#f0f0f0'
M.colors.transparent = '#24283b'
M.colors.none = 'none'
M.colors.black = '#1a1b26'
M.colors.gray = '#636da6'
M.colors.b_red = '#e5b0be'
M.colors.cursor_line = '#312942'

return M
