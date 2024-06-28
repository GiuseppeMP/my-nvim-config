---@diagnostic disable: unused-local, unused-function
---
local function config()
    vim.opt.termguicolors = true
    local tokyo_colors = require("tokyonight.colors").setup()
    local tokyo = { fg = tokyo_colors.fg, bg = 'none', sp = tokyo_colors.sp }
    tokyo.green = '#98f3a1'
    local offsets = {}

    -- for _, win in ipairs(vim.fn.getwininfo()) do
    --     if win.winrow == 2 and (wincol == 1 or wincol == max) then
    --         table.insert(offsets, win.id)
    --     end
    -- end
    local diagnostics_indicator = function(count, level, diagnostics_dict, context)
        if context.buffer:current() then
            return ''
        end
        return ''
    end

    require 'bufferline'.setup({
        highlights = {
            fill = tokyo,
            background = tokyo,
            tab = { fg = tokyo_colors.magenta, bg = tokyo.bg },
            tab_selected = { fg = tokyo_colors.blue, bg = tokyo.bg },
            tab_close = tokyo,
            close_button = { fg = tokyo_colors.magenta, bg = tokyo.bg },
            close_button_visible = { fg = tokyo_colors.magenta, bg = tokyo.bg },
            close_button_selected = { fg = tokyo_colors.red, bg = tokyo.bg },
            buffer_visible = tokyo,
            buffer_selected = {
                fg = '#98f3a1',
                bg = tokyo.bg
            },
            numbers = tokyo,
            numbers_visible = tokyo,
            numbers_selected = {
                fg = '#98f3a1',
                bg = tokyo.bg,
                sp = tokyo_colors.sp,
                bold = true,
                italic = true,
            },
            diagnostic = tokyo,
            diagnostic_visible = tokyo,
            diagnostic_selected = tokyo,
            hint = tokyo,
            hint_visible = tokyo,
            hint_selected = tokyo,
            info = tokyo,
            info_visible = tokyo,
            info_selected = tokyo,
            separator_visible = tokyo,
        },
        options = {
            themable = true,
            mode = 'buffers',
            numbers = "ordinal",
            close_command = "Bdelete! %d",
            right_mouse_command = "Bdelete! %d",
            left_mouse_command = "buffer %d",
            middle_mouse_command = nil,
            indicator = 'none',
            -- indicator = diagnostics_indicator,
            buffer_close_icon = '',
            modified_icon = "●",
            close_icon = "",
            left_trunc_marker = "",
            right_trunc_marker = "",
            max_name_length = 35,
            max_prefix_length = 35, -- prefix used when a buffer is de-duplicated
            tab_size = 20,
            diagnostics = "nvim_lsp",
            offsets = { {
                filetype = "NvimTree",
                text = function()
                    return '  Files'
                    -- return '  '
                    -- return '   Files'
                end,
                highlight = "NvimTreeDirectoryBufferline",
                padding = 0,
                separator = "┃",
            }
            },
            -- offsets = offsets,
            show_buffer_icons = true,
            show_buffer_close_icons = true,
            show_close_icon = true,
            show_tab_indicators = true,
            persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
            separator_style = "slope",
            enforce_regular_tabs = true,
            always_show_bufferline = true,
            color_icons = true
        },
    })
end
return {
    {
        'akinsho/bufferline.nvim',
        version = '*',
        dependencies = 'folke/tokyonight.nvim',
        config = config
    },
}
