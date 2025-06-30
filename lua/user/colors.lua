local M = {}
M.util = require("tokyonight.util")
local tokyo_colors = require("tokyonight.colors").setup()

local function createTokyoColors()
    local colors = tokyo_colors
    colors.green = '#b1ce92'
    colors.b_green = '#bee5b0'
    colors.purple = '#a198f3'
    colors.magenta = '#a198f3'
    colors.moca = '#291c17'
    colors.b_yellow = '#FCDC94'
    colors.bg = 'none'
    colors.dbg = 'none'
    colors.transparent = '#24283b'
    colors.none = 'none'
    colors.black = '#1a1b26'
    colors.gray = '#636da6'
    colors.b_red = '#e5b0be'
    colors.cursor_line = '#312942'
    return colors
end

local function createCatppucinColors()
    -- local colors = require("catppuccin.palettes").get_palette "mocha"
    local colors = require("catppuccin.palettes").get_palette "mocha"
    -- {
    --     base = "#1e1e2e",
    --     blue = "#89b4fa",
    --     crust = "#11111b",
    --     flamingo = "#f2cdcd",
    --     green = "#a6e3a1",
    --     lavender = "#b4befe",
    --     mantle = "#181825",
    --     maroon = "#eba0ac",
    --     mauve = "#cba6f7",
    --     overlay0 = "#6c7086",
    --     overlay1 = "#7f849c",
    --     overlay2 = "#9399b2",
    --     peach = "#fab387",
    --     pink = "#f5c2e7",
    --     red = "#f38ba8",
    --     rosewater = "#f5e0dc",
    --     sapphire = "#74c7ec",
    --     sky = "#89dceb",
    --     subtext0 = "#a6adc8",
    --     subtext1 = "#bac2de",
    --     surface0 = "#313244",
    --     surface1 = "#45475a",
    --     surface2 = "#585b70",
    --     teal = "#94e2d5",
    --     text = "#cdd6f4",
    --     yellow = "#f9e2af"
    -- }
    colors.b_green = colors.green
    colors.purple = colors.mauve
    colors.magenta = colors.mauve
    colors.moca = colors.base
    colors.b_yellow = colors.yellow
    colors.bg = 'none'
    colors.dbg = 'none'
    colors.none = 'none'
    colors.transparent = 'none'
    -- colors.transparent = '#24283b'
    colors.black = colors.base
    colors.gray = colors.surface0
    colors.b_red = colors.red
    colors.cursor_line = '#312942'
    return colors
end

-- M.colors = createTokyoColors()
M.colors = createCatppucinColors()

return M
