---@diagnostic disable: unused-local, unused-function
local colors = require 'user.colors'.colors
local function config()
    vim.opt.termguicolors = true
    ---@diagnostic disable-next-line: undefined-field
    local tokyo = { fg = colors.fg, bg = 'none', sp = colors.sp }
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
            tab = { fg = colors.magenta, bg = tokyo.bg },
            tab_selected = { fg = colors.blue, bg = tokyo.bg },
            tab_close = tokyo,
            close_button = { fg = colors.magenta, bg = tokyo.bg },
            close_button_visible = { fg = colors.magenta, bg = tokyo.bg },
            close_button_selected = { fg = colors.red, bg = tokyo.bg },
            buffer_visible = tokyo,
            buffer_selected = {
                fg = colors.green,
                bg = tokyo.bg
            },
            numbers = tokyo,
            numbers_visible = tokyo,
            numbers_selected = {
                fg = colors.green,
                bg = tokyo.bg,
                sp = tokyo.sp,
                bold = true,
                italic = false,
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
                    return '🭹🭹🭹🭹🭹🭹 Files 🭹🭹🭹🭹🭹🭹'
                    -- return ''
                end,
                highlight = "NvimTreeDirectoryBufferline",
                padding = 0,
                separator = "│",
            }
            },
            -- offsets = offsets,
            show_buffer_icons = true,
            show_buffer_close_icons = true,
            show_close_icon = true,
            show_tab_indicators = true,
            persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
            separator_style = { "", "|" },
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
