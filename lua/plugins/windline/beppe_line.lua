local windline = require('windline')
local helper = require('windline.helpers')
local b_components = require('windline.components.basic')
---@diagnostic disable-next-line: undefined-field
local state = _G.WindLine.state
local tokyo_colors = require("user.colors").colors
local sep = helper.separators
local lsp_comps = require('windline.components.lsp')
local git_comps = require('windline.components.git')
local vim_components = require('windline.components.vim')
local hostname = vim.fn.hostname()
local icon_comp = b_components.cache_file_icon({ default = '', hl_colors = { 'bwhite', 'bg' } })

local nvim_hl = {
    Normal = { 'black', 'red' },
    Insert = { 'black', 'green', 'bold' },
    Visual = { 'black', 'yellow', 'bold' },
    Replace = { 'black', 'blue_light', 'bold' },
    Command = { 'black', 'magenta', 'bold' },
    NormalBefore = { 'red', 'bg' },
    InsertBefore = { 'green', 'bg' },
    VisualBefore = { 'yellow', 'bg' },
    ReplaceBefore = { 'blue_light', 'bg' },
    CommandBefore = { 'magenta', 'bg' },
    NormalAfter = { 'white', 'red' },
    InsertAfter = { 'white', 'green' },
    VisualAfter = { 'white', 'yellow' },
    ReplaceAfter = { 'white', 'blue_light' },
    CommandAfter = { 'white', 'magenta' },
}

local hl_list = {
    Black = { 'white', 'bg' },
    White = { 'black', 'white' },
    Inactive = { 'InactiveFg', 'InactiveBg' },
    Active = { 'ActiveFg', 'ActiveBg' },
}

local basic = {}

local text_hostname = hostname

if string.len(hostname) > 20 then
    text_hostname = string.sub(hostname, -20)
end

basic.hostname = {
    text = text_hostname,
}

basic.logo = {

    hl_colors = {
        Normal = { 'red', 'black' },
        Insert = { 'green', 'black', 'bold' },
        Visual = { 'yellow', 'black', 'bold' },
        Replace = { 'blue_light', 'black', 'bold' },
        Command = { 'magenta', 'black', 'bold' },
        NormalBefore = { 'black', 'red' },
        NormalBeforeRound = { 'red', 'bg' },
        InsertBefore = { 'black', 'green' },
        InsertBeforeRound = { 'green', 'bg' },
        VisualBefore = { 'black', 'yellow' },
        VisualBeforeRound = { 'yellow', 'bg' },
        ReplaceBefore = { 'black', 'blue_light' },
        ReplaceBeforeRound = { 'blue_light', 'bg' },
        CommandBefore = { 'black', 'magenta' },
        CommandBeforeRound = { 'magenta', 'bg' },
        NormalAfter = { 'red', 'white' },
        InsertAfter = { 'green', 'white' },
        VisualAfter = { 'yellow', 'white' },
        ReplaceAfter = { 'blue_light', 'white' },
        CommandAfter = { 'magenta', 'white' },
    },
    text = function()
        return {
            { ' ', state.mode[2] .. 'Before' },
            { ' ', state.mode[2] .. 'Before' },
            { sep.right_rounded, state.mode[2] .. 'BeforeRound' },
        }
    end,
}

local breakpoint_width = 90
basic.divider = { b_components.divider, '' }
basic.bg = { ' ', 'StatusLine' }

local colors_mode = {
    Normal = { 'vgreen', 'black' },
    Insert = { 'green', 'black' },
    Visual = { 'yellow', 'black' },
    Replace = { 'red', 'black' },
    Command = { 'magenta', 'black' },
}

basic.vi_mode = {
    width = 30,
    hl_colors = nvim_hl,
    text = function()
        return {
            { sep.left_rounded, state.mode[2] .. 'Before' },
            { state.mode[1] .. ' ', state.mode[2] },
            { ' 󰢩 ' .. text_hostname .. ' ', state.mode[2] .. 'Before' },
        }
    end,
}
basic.vi_mode_sep_right = {
    hl_colors = {
        Normal = { 'red', 'bg', 'bold' },
        Insert = { 'green', 'bg', 'bold' },
        Visual = { 'yellow', 'bg', 'bold' },
        Replace = { 'blue_light', 'bg', 'bold' },
        Command = { 'magenta', 'bg', 'bold' },
        NormalBefore = { 'bg', 'red', 'bold' },
        InsertBefore = { 'bg', 'green', 'bold' },
        VisualBefore = { 'bg', 'yellow', 'bold' },
        ReplaceBefore = { 'bg', 'blue_light', 'bold' },
        CommandBefore = { 'bg', 'magenta', 'bold' },
    },
    text = function()
        return {
            { '  ',              state.mode[2] .. 'Before' },
            { sep.right_rounded, state.mode[2], },
        }
    end,
}


basic.square_mode = {
    hl_colors = colors_mode,
    text = function()
        return { { '▊', state.mode[2] } }
    end,
}

basic.lsp_diagnos = {
    name = 'diagnostic',
    hl_colors = {
        red = { 'red', 'bg' },
        yellow = { 'yellow', 'bg' },
        blue = { 'blue', 'bg' },
        magenta = { 'magenta', 'bg' },
    },
    width = breakpoint_width,
    text = function(bufnr)
        if lsp_comps.check_lsp(bufnr) then
            return {
                { lsp_comps.lsp_error({ format = ' ' .. conf.signs.error .. ' %s', show_zero = true }),  'red' },
                { lsp_comps.lsp_warning({ format = ' ' .. conf.signs.warn .. ' %s', show_zero = true }), 'yellow' },
                { lsp_comps.lsp_hint({ format = ' ' .. conf.signs.hint .. ' %s', show_zero = true }),    'blue' },
                { ' ',                                                                                   '' },
            }
        end
        return ' '
    end,

}

basic.file = {
    hl_colors = {
        default = { 'bwhite', 'black_light' },
        virtual = { 'vgreen', 'black' },
        virtual_bg = { 'vgreen', 'black' },
        bubble_bg = { 'bgreen', 'bg' },
        green = { 'green', 'bg' },
    },
    text = function(bufnr)
        return {
            { ' ', 'bubble_bg' },
            icon_comp(bufnr),
            { ' ', 'bubble_bg' },
            { " ", '' },
            { b_components.cache_file_name('[No Name]', ''), 'green' },
            { b_components.file_modified(' '), 'green' },
            { b_components.cache_file_size(), 'green' },
            { " ", '' },
        }
    end,
}

basic.right = {
    hl_colors = {
        sep_before = { 'black_light', 'white_light' },
        sep_after = { 'white', 'bg' },
        text = { 'black', 'white_light' },
        bubble_bg = { 'white', 'bg' }
    },
    text = function()
        return {
            { b_components.line_col_lua, 'bubble_bg' },
            { sep.right_rounded,         'bubble_bg', },
        }
    end,
}

basic.file_right = {
    hl_colors = {
        default = hl_list.Black,
        white = { 'white', 'black' },
        magenta = { 'magenta', 'black' },
        bubble_bg = { 'white', 'bg' }
    },
    text = function(_, _, width)
        if width < breakpoint_width then
            return {
                { b_components.line_col_lua, 'bubble_bg' },
                { b_components.progress_lua, 'bubble_bg' },
            }
        end
    end,
}
basic.git = {
    name = 'git',
    hl_colors = {
        green = { 'green', 'bg' },
        red = { 'red', 'bg' },
        blue = { 'blue', 'bg' },
        magenta = { 'magenta', 'bg' },
        yellow = { 'yellow', 'bg' },
        virtual = { 'vgreen', 'bg' },
        virtual_bg = { 'vgreen', 'bg' }
    },
    width = breakpoint_width,
    text = function(bufnr)
        if git_comps.is_git(bufnr) then
            return {
                { '  status', 'magenta' },
                { git_comps.diff_removed({ format = ' ' .. conf.icons.git.removed .. ' %s', show_zero = true }), 'red' },
                { git_comps.diff_changed({ format = ' ' .. conf.icons.git.changed .. ' %s', show_zero = true }), 'yellow' },
                { git_comps.diff_added({ format = ' ' .. conf.icons.git.added .. ' %s', show_zero = true }), 'blue' },
            }
        end
        return ''
    end,
}

local quickfix = {
    filetypes = { 'qf', 'Trouble' },
    active = {
        { ' ', { 'dbg', 'dbg' } },
        { sep.left_rounded, { 'bwhite', 'bg' } },
        { '🔥 Quickfix ', { 'black', 'bwhite' } },
        {
            function()
                return vim.fn.getqflist({ title = 0 }).title
            end,
            { 'cyan', 'bg' },
        },
        { ' Total: %L ', { 'bwhite', 'bg' } },
        basic.divider,
        { ' ', { 'black', 'bwhite' } },
        { '%L 󱧖 ', { 'black', 'bwhite' } },
        { sep.right_rounded, { 'bwhite', 'dbg' } },
        { ' ', { 'black', 'dbg' } },

    },
    always_active = true,
    show_last_status = true,
}

local explorer = {
    filetypes = { 'fern', 'NvimTree', 'lir' },
    active = {
        { '  ', { 'blue', 'red' } },
        { helper.separators.slant_right, { 'blue', 'NormalBg' } },
        { b_components.divider, '' },
        { b_components.file_name(''), { 'white', 'NormalBg' } },
    },
    always_active = true,
    show_last_status = true,
}

basic.lsp_name = {
    width = breakpoint_width,
    name = 'lsp_name',
    hl_colors = {
        magenta = { 'magenta', 'bg' },
    },
    text = function(bufnr)
        if lsp_comps.check_lsp(bufnr) then
            return {
                { lsp_comps.lsp_name(), 'magenta' },
            }
        end
        return {
            { ' ',                                            '' },
            icon_comp(bufnr),
            { ' ',                                            '' },
            { " ",                                            '' },
            { b_components.cache_file_type({ icon = false }), 'magenta' },
        }
    end,
}

basic.battery = {
    name = 'battery',
    hl_colors = nvim_hl,
    width = breakpoint_width,
    text = function(_)
        return {
            { require("battery").get_status_line(), state.mode[2] .. 'Before' },
        }
    end,
}

local default = {
    filetypes = { 'default' },
    active = {
        { ' ',                           'none' },
        basic.vi_mode,
        basic.file,
        { vim_components.search_count(), { 'white', 'bg' } },
        basic.divider,
        -- { sep.right_rounded,             { 'vgreen', 'bg' } },
        -- basic.vi_mode_sep_right,
        -- basic.square_mode,
        -- basic.vi_mode,

        -- basic.divider,
        -- { sep.left_rounded, { 'magenta', 'bg' } },
        -- { ' ',              { 'magenta', 'bg' } },
        basic.lsp_name,
        basic.lsp_diagnos,
        -- basic.genai,
        -- { ' ',               { 'magenta', 'bg' } },
        -- { sep.right_rounded, { 'magenta', 'bg' } },
        -- basic.divider,
        -- { sep.left_rounded, { 'vgreen', 'bg' } },
        -- { ' ',              { 'vgreen', 'bg' } },
        -- { ' ',               { 'vgreen', 'bg' } },
        -- { sep.right_rounded, { 'vgreen', 'bg' } },
        basic.divider,
        basic.file_right,
        basic.git,
        { git_comps.git_branch(), { 'vgreen', 'bg' }, breakpoint_width },
        { ' ',                    hl_list.Black },
        -- basic.right,
        basic.battery,
        { ' ', '' },
        basic.logo,
        { ' ', '' },
    },
    inactive = {
        { b_components.full_file_name, hl_list.Inactive },
        basic.file_name_inactive,
        basic.divider,
        basic.divider,
        { b_components.line_col,       hl_list.Inactive },
        { b_components.progress,       hl_list.Inactive },
    },
}


windline.setup({
    colors_name = function(colors)
        colors.black = tokyo_colors.black
        colors.magenta = tokyo_colors.magenta
        colors.red = tokyo_colors.red
        colors.blue = tokyo_colors.blue
        colors.yellow = tokyo_colors.yellow
        colors.green = tokyo_colors.green
        colors.bgreen = '#98f3a1'
        colors.vgreen = '#0db9d7'
        colors.vgreen_bg = '#203346'
        -- colors.bg = tokyo_colors.bg
        -- colors.dbg = tokyo_colors.bg_dark
        colors.bwhite = '#ffffff'
        colors.bg = 'none'
        colors.dbg = 'none'
        return colors
    end,
    statuslines = {
        default,
        quickfix,
        explorer,
    },
})
