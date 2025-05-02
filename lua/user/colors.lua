local tokyo_colors = require("tokyonight.colors").setup {
    transparent = true,
    styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "transparent", -- style for sidebars, see below
        floats = "transparent",   -- style for floating windows
    }
}
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
M.colors.bg = 'none'
M.colors.dbg = 'none'
M.colors.transparent = '#24283b'
M.colors.none = 'none'
M.colors.black = '#1a1b26'
M.colors.gray = '#636da6'
M.colors.b_red = '#e5b0be'
M.colors.cursor_line = '#312942'

return M
