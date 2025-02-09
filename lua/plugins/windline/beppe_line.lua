-- highlights
local user_colors = require("user.colors").colors

local colors = {
    --- ??
    text = { 'black', 'white_light' },

    -- icons
    DevIconDefault = { 'white', 'lbg_fix' },
    DevIconLua = { 'white', 'lbg_fix' },

    --- diagnostics
    red = { 'red', 'lbg_fix' },
    yellow = { 'yellow', 'lbg_fix' },
    blue = { 'blue', 'lbg_fix' },
    magenta = { 'magenta', 'lbg_fix' },
    -- files
    default = { 'bwhite', 'lbg_fix' },
    virtual = { 'vgreen', 'lbg_fix' },
    virtual_bg = { 'vgreen', 'lbg_fix' },
    bubble_bg = { 'bgreen', 'lbg_fix' },
    green = { 'green', 'lbg_fix' },

    -- ???
    Black = { 'white', 'bg' },
    White = { 'black', 'white' },
    Inactive = { 'InactiveFg', 'InactiveBg' },
    Active = { 'ActiveFg', 'ActiveBg' },
    Label = { 'lbg', 'bg' },
    LabelOff = { 'white', 'lbg_fix' },
    Divider = { 'lbg_fix', 'lbg_fix' },
    label_red = { 'red', 'lbg_fix' },
    label_yellow = { 'yellow', 'lbg_fix' },
    label_blue = { 'blue', 'lbg_fix' },

    -- VIM Modes
    Normal = { 'red', 'lbg_fix' },
    NormalOff = { 'lbg_fix', 'red_fix' },
    Insert = { 'green', 'lbg_fix' },
    InsertOff = { 'lbg_fix', 'green_fix' },
    Visual = { 'yellow', 'lbg_fix' },
    VisualOff = { 'lbg_fix', 'yellow_fix' },
    Replace = { 'blue_light', 'lbg_fix' },
    ReplaceOff = { 'lbg_fix', 'blue_light_fix' },
    Command = { 'magenta', 'lbg_fix' },
    CommandOff = { 'lbg_fix', 'magenta_fix' },
    transparent = { 'none', 'none' },

}
--  imports
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
local icon_comp = b_components.cache_file_icon({ default = ' ', hl_colors = { '', 'lbg_fix' } })

-- get data/texts/variables
local text_hostname = hostname
if string.len(hostname) > 15 then
    text_hostname = string.sub(hostname, -14)
end

local padding = function(str, number)
    local halfPadding = math.floor((number - #str) / 2)
    return string.rep(" ", halfPadding) .. str .. string.rep(" ", number - #str - halfPadding);
end

local default_width = 90

-- create the line
local components = {}

-- create closing logo sequence
components.end_logo = {
    hl_colors = colors,
    text = function()
        return {
            {
                '  ',
                state.mode[2] .. 'Off',
            },
            {
                sep.right_rounded,
                state.mode[2],
            },
            { ' ', 'transparent' },
        }
    end,
}


-- components.divider = { b_components.divider, 'Divider' }
components.bg = { ' ', 'StatusLine' }

components.divider = {
    hl_colors = colors,
    text = function()
        return {
            -- { '%=', 'Divider' }
            { b_components.divider, 'Divider' }
        }
    end,
}
components.r_divider = {
    hl_colors = colors,
    text = function()
        return {
            { '%=%', 'Divider' }
        }
    end,
}

components.vi_mode = {
    width = 40,
    hl_colors = colors,
    text = function()
        return {
            { '   ', 'transparent' },
            { sep.left_rounded, state.mode[2] },
            { padding(state.mode[1] .. ' ', 9), state.mode[2] .. 'Off' },
            { ' 󰢩 ' .. text_hostname .. ' ', state.mode[2] },
        }
    end,
}

components.file = {
    hl_colors = colors,
    with = 50,
    text = function(bufnr)
        return {
            { ' ',                                           'bubble_bg' },
            icon_comp(bufnr),
            { ' ',                                           'bubble_bg' },
            { b_components.cache_file_name('[No Name]', ''), 'LabelOff' },
            { b_components.cache_file_size(),                'LabelOff' },
            { b_components.file_modified('*'),               'red' },
        }
    end,
}

components.lsp_diagnos = {
    name = 'diagnostic',
    hl_colors = colors,
    width = default_width,
    text = function(bufnr)
        if lsp_comps.check_lsp(bufnr) then
            return {
                -- { sep.left_rounded, 'Label' },
                { lsp_comps.lsp_error({ format = ' %s', show_zero = true }), 'label_red' },
                { lsp_comps.lsp_warning({ format = '  %s', show_zero = true }), 'label_yellow' },
                { lsp_comps.lsp_hint({ format = '  %s         ', show_zero = true }), 'label_blue' },
                -- { sep.right_rounded, 'Label' },
            }
        end
        return ' '
    end,

}


components.right = {
    hl_colors = colors,
    text = function()
        return {
            { b_components.line_col_lua, 'bubble_bg' },
            { sep.right_rounded,         'bubble_bg', },
        }
    end,
}

components.file_right = {
    hl_colors = {
        default = colors.Black,
        white = { 'white', 'black' },
        magenta = { 'magenta', 'black' },
        bubble_bg = { 'white', 'bg' }
    },
    text = function(_, _, width)
        if width < default_width then
            return {
                { b_components.line_col_lua, 'bubble_bg' },
                { b_components.progress_lua, 'bubble_bg' },
            }
        end
    end,
}
components.git = {
    name = 'git',
    hl_colors = colors,
    width = default_width,
    text = function(bufnr)
        if git_comps.is_git(bufnr) then
            return {
                -- { sep.left_rounded,                                                                              'Label' },
                { git_comps.git_branch(), state.mode[2] },
                { '  ', state.mode[2] },
                { git_comps.diff_removed({ format = ' ' .. conf.icons.git.removed .. ' %s', show_zero = true }), 'label_red' },
                { git_comps.diff_changed({ format = ' ' .. conf.icons.git.changed .. ' %s', show_zero = true }), 'label_yellow' },
                { git_comps.diff_added({ format = ' ' .. conf.icons.git.added .. ' %s        ', show_zero = true }), 'label_blue' },
                -- { sep.right_rounded,                                                                             'Label' },
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
        components.divider,
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

components.lsp_name = {
    width = default_width,
    name = 'lsp_name',
    hl_colors = colors,
    text = function(bufnr)
        if lsp_comps.check_lsp(bufnr) then
            return {
                { lsp_comps.lsp_name(), state.mode[2] },
                { '  ', state.mode[2] },
            }
        end
        return {
            icon_comp(bufnr),
            { b_components.cache_file_type({ icon = false }), 'LabelOff' },
        }
    end,
}

components.battery = {
    name = 'battery',
    hl_colors = colors,
    width = default_width,
    text = function(_)
        return {
            { ' ' .. require("battery").get_status_line() .. ' ', 'LabelOff' },
        }
    end,
}

local default = {
    filetypes = { 'default' },
    active = {
        components.vi_mode,
        -- { git_comps.git_branch(),        { 'vgreen', 'bg' }, default_width },
        components.file,
        { vim_components.search_count(), { 'yellow', 'lbg_fix' } },
        components.divider,
        components.lsp_name,
        components.lsp_diagnos,
        -- components.divider,
        -- components.r_divider,
        -- components.file_right,
        components.git,
        components.battery,
        components.end_logo,
    },
    inactive = {
        { b_components.full_file_name, colors.Inactive },
        components.file_name_inactive,
        components.divider,
        { b_components.line_col,       colors.Inactive },
        { b_components.progress,       colors.Inactive },
    },
}


windline.setup({
    colors_name = function(_colors)
        _colors.black = tokyo_colors.black
        _colors.magenta = tokyo_colors.magenta
        _colors.magenta_fix = '#9189DC'
        _colors.red = tokyo_colors.red
        _colors.red_fix = '#E76972'
        _colors.blue = tokyo_colors.blue
        _colors.yellow = tokyo_colors.yellow
        _colors.yellow_fix = '#E7b46b'
        _colors.blue_light_fix = '#e7c49c'
        _colors.green = tokyo_colors.green
        _colors.green_fix = '#A0BA84'
        _colors.bgreen = '#98f3a1'
        _colors.vgreen = '#0db9d7'
        _colors.vgreen_bg = '#203346'
        -- colors.bg = tokyo_colors.bg
        -- colors.dbg = tokyo_colors.bg_dark
        _colors.bwhite = '#ffffff'
        _colors.white = '#B5BFDE'
        -- _colors.white = user_colors.white
        _colors.bg = 'none'
        _colors.dbg = 'none'
        _colors.none = 'none'
        _colors.lbg = '#343855'
        _colors.lbg_fix = '#1E2030'
        -- transparent:
        -- _colors.lbg_fix = _colors.bg
        return _colors
    end,
    statuslines = {
        default,
        quickfix,
        explorer,
    },
})
