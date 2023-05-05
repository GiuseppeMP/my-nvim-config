vim.opt.termguicolors = true

local tokyo_colors = require("tokyonight.colors").setup()

require 'bufferline'.setup {
    highlights = {
        close_button_selected = {
            fg = tokyo_colors.red,
            bg = tokyo_colors.bg,
        },

        tab = {
            fg = tokyo_colors.magenta,
            bg = tokyo_colors.bg
        },
        tab_selected = {
            fg = tokyo_colors.blue,
            bg = tokyo_colors.bg
        },
        buffer_selected = {
            fg = tokyo_colors.green,
            bg = tokyo_colors.bg
        },

        numbers = {
            fg = tokyo_colors.magenta,
            bg = tokyo_colors.bg,
            bold = true,

        },

        fill = {
            fg = tokyo_colors.fg,
            bg = tokyo_colors.bg
        },
        buffer_visible = {
            fg = tokyo_colors.fg,
            bg = tokyo_colors.bg
        },
        background = {
            fg = tokyo_colors.fg,
            bg = tokyo_colors.bg
        }
    },
    options = {
        themable = true,
        mode = 'buffers',
        numbers = "ordinal",
        close_command = "Bdelete! %d",
        right_mouse_command = "Bdelete! %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,
        indicator = { style = "icon", icon = " │ " },
        buffer_close_icon = '',
        modified_icon = "●",
        close_icon = "",
        -- close_icon = '',
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 30,
        max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
        tab_size = 15,
        diagnostics = "nvim_lsp",
        offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        separator_style = {},
        enforce_regular_tabs = true,
        always_show_bufferline = true,
    },
}
