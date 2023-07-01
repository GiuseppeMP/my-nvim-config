local windline = require('windline')
local helper = require('windline.helpers')
local b_components = require('windline.components.basic')
local state = _G.WindLine.state
local tokyo_colors = require("tokyonight.colors").setup()
local sep = helper.separators
local lsp_comps = require('windline.components.lsp')
local git_comps = require('windline.components.git')
local vim_components = require('windline.components.vim')

local hl_list = {
    Black = { 'white', 'bg' },
    White = { 'black', 'white' },
    Inactive = { 'InactiveFg', 'InactiveBg' },
    Active = { 'ActiveFg', 'ActiveBg' },
}
local basic = {}
basic.logo = {

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
        sep_before = { 'blue', 'black' },
        default = { 'black', 'blue' },
        virtual = { 'vgreen', 'black' },
        virtual_bg = { 'vgreen', 'black' },
        virtual_rev = { 'black', 'vgreen' },
        black_bg = { 'black', 'black' }

    },
    text = function()
        return {
            { ' ',               state.mode[2] .. 'Before' },
            { ' ',            state.mode[2] .. 'Before' },
            { sep.right_rounded, state.mode[2] },
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
    hl_colors = {
        Normal = { 'black', 'red' },
        Insert = { 'black', 'green', 'bold' },
        Visual = { 'black', 'yellow', 'bold' },
        Replace = { 'black', 'blue_light', 'bold' },
        Command = { 'black', 'magenta', 'bold' },
        NormalBefore = { 'red', 'black' },
        InsertBefore = { 'green', 'black' },
        VisualBefore = { 'yellow', 'black' },
        ReplaceBefore = { 'blue_light', 'black' },
        CommandBefore = { 'magenta', 'black' },
        NormalAfter = { 'white', 'red' },
        InsertAfter = { 'white', 'green' },
        VisualAfter = { 'white', 'yellow' },
        ReplaceAfter = { 'white', 'blue_light' },
        CommandAfter = { 'white', 'magenta' },
    },
    text = function()
        return {
            { sep.left_rounded,     state.mode[2] .. 'Before' },
            { state.mode[1] .. ' ', state.mode[2] },
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
local icon_comp = b_components.cache_file_icon({ default = '', hl_colors = { 'bwhite', 'bg' } })
basic.file = {
    hl_colors = {
        default = { 'bwhite', 'black_light' },
        virtual = { 'vgreen', 'black' },
        virtual_bg = { 'vgreen', 'black' },
        bubble_bg = { 'bgreen', 'bg' }
    },
    text = function(bufnr)
        return {
            { ' ',                                           'bubble_bg' },
            icon_comp(bufnr),
            { ' ',                                           'bubble_bg' },
            { b_components.cache_file_name('[No Name]', ''), '' },
            { b_components.file_modified(' '),            '' },
            { b_components.cache_file_size(),                '' },
            { " ",                                           '' },
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
basic.genai = {
    name = 'genai',
    width = breakpoint_width,
    hl_colors = {
        green = { 'green', 'bg' },
        red = { 'red', 'bg' },
        blue = { 'blue', 'bg' },
        magenta = { 'magenta', 'bg' },
        yellow = { 'yellow', 'bg' },
        cyan = { 'cyan', 'bg' },
        virtual = { 'vgreen', 'bg' },
        virtual_bg = { 'vgreen', 'bg' }
    },
    text = function(_)
        if conf.user.codeium.enabled then
            return {
                { '  ',  'virtual_bg' },
                { function()
                    if conf.user.copilot.enabled
                    then
                        return ' '
                    else
                        return ' '
                    end
                end, 'virtual' },
                { ' 󰚩 ', 'virtual_bg' },
                { function()
                    if
                        conf.user.chatgpt.enabled then
                        return ' '
                    else
                        return ' '
                    end
                end, 'virtual' },
                { '  ', 'virtual_bg' },
                {
                    function()
                        local status = vim.fn['codeium#GetStatusString']():lower()
                        if status:gsub("%s", "") == '' or status == nil or string.len(status) ~= 3 or string.find(status, 'on') ~= nil then
                            return ' '
                        else
                            return status:gsub(" ", "")
                        end
                    end, 'virtual' },
            }
        end
    end
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
                { '  status',                                                                                 'magenta' },
                { git_comps.diff_removed({ format = ' ' .. conf.icons.git.removed .. ' %s', show_zero = true }), 'red' },
                { git_comps.diff_changed({ format = ' ' .. conf.icons.git.changed .. ' %s', show_zero = true }), 'yellow' },
                { git_comps.diff_added({ format = ' ' .. conf.icons.git.added .. ' %s', show_zero = true }),     'blue' },
            }
        end
        return ''
    end,
}

local quickfix = {
    filetypes = { 'qf', 'Trouble' },
    active = {
        { ' ',              { 'dbg', 'dbg' } },
        { sep.left_rounded, { 'bwhite', 'bg' } },
        { '🔥 Quickfix ', { 'bg', 'bwhite' } },
        {
            function()
                return vim.fn.getqflist({ title = 0 }).title
            end,
            { 'cyan', 'bg' },
        },
        { ' Total: %L ',     { 'bwhite', 'bg' } },
        basic.divider,
        { ' ',               { 'dbg', 'bwhite' } },
        { '%L 󱧖 ',        { 'dbg', 'bwhite' } },
        { sep.right_rounded, { 'bwhite', 'dbg' } },
        { ' ',               { 'dbg', 'dbg' } },

    },
    always_active = true,
    show_last_status = true,
}

local explorer = {
    filetypes = { 'fern', 'NvimTree', 'lir' },
    active = {
        { '  ',                       { 'blue', 'red' } },
        { helper.separators.slant_right, { 'blue', 'NormalBg' } },
        { b_components.divider,          '' },
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
            { b_components.cache_file_type({ icon = true }), 'magenta' },
        }
    end,
}

local default = {
    filetypes = { 'default' },
    active = {
        { ' ',                           'black' },
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
        basic.genai,
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
        colors.bgreen = '#69ff94'
        colors.vgreen = '#0db9d7'
        colors.vgreen_bg = '#203346'
        colors.bg = tokyo_colors.bg
        colors.dbg = tokyo_colors.bg_dark
        colors.bwhite = '#ffffff'
        return colors
    end,
    statuslines = {
        default,
        quickfix,
        explorer,
    },
})
