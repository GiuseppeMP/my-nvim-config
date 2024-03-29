local windline = require('windline')
local helper = require('windline.helpers')
local b_components = require('windline.components.basic')
local state = _G.WindLine.state
local tokyo_colors = require("tokyonight.colors").setup()

local lsp_comps = require('windline.components.lsp')
local git_comps = require('windline.components.git')

local hl_list = {
    Black = { 'white', 'black' },
    -- Black = { tokyo_colors.dark3 },
    White = { 'black', 'white' },
    Inactive = { 'InactiveFg', 'InactiveBg' },
    Active = { 'ActiveFg', 'ActiveBg' },
}
local basic = {}

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
    name = 'vi_mode',
    hl_colors = colors_mode,
    text = function()
        return { { ' 󰅬  ' .. state.mode[1] .. ' ', state.mode[2] } }
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
        red = { 'red', 'black' },
        yellow = { 'yellow', 'black' },
        blue = { 'blue', 'black' },
        magenta = { 'magenta', 'black' },
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
    name = 'file',
    hl_colors = {
        default = hl_list.Black,
        white = { 'white', 'black' },
        magenta = { 'magenta', 'black' },
    },
    text = function(_, _, width)
        if width > breakpoint_width then
            return {
                { b_components.cache_file_size(),                      'default' },
                { ' ',                                                 '' },
                { b_components.cache_file_icon({ default = '' }),   'magenta' },
                { ' ',                                                 '' },
                { b_components.cache_file_name('[No Name]', 'unique'), 'magenta' },
                { b_components.line_col_lua,                           'white' },
                { b_components.progress_lua,                           '' },
                { ' ',                                                 '' },
                { b_components.file_modified(' '),                  'magenta' },
            }
        else
            return {
                { b_components.cache_file_size(),                      'default' },
                { ' ',                                                 '' },
                { b_components.cache_file_icon({ default = '' }),   'default' },
                { b_components.cache_file_name('[No Name]', 'unique'), 'magenta' },
                { ' ',                                                 '' },
                { b_components.file_modified(' '),                  'magenta' },
            }
        end
    end,
}
basic.file_right = {
    hl_colors = {
        default = hl_list.Black,
        white = { 'white', 'black' },
        magenta = { 'magenta', 'black' },
    },
    text = function(_, _, width)
        if width < breakpoint_width then
            return {
                { b_components.line_col_lua, 'white' },
                { b_components.progress_lua, '' },
            }
        end
    end,
}
basic.genai = {
    name = 'genai',
    hl_colors = {
        green = { 'green', 'black' },
        red = { 'red', 'black' },
        blue = { 'blue', 'black' },
        magenta = { 'magenta', 'black' },
        yellow = { 'yellow', 'black' },
        cyan = { 'cyan', 'black' },
        virtual = { 'vgreen', 'black' },
        virtual_bg = { 'vgreen', 'black' }
    },
    text = function(_)
        if conf.user.codeium.enabled then
            return {
                { '▊',           'virtual' },
                { '  copilot ', 'virtual_bg' },
                { function()
                    if conf.user.copilot.enabled
                    then
                        return ''
                    else
                        return ''
                    end
                end, 'virtual' },
                { ' 󰚩 chat-gpt ', 'virtual_bg' },
                { function()
                    if
                        conf.user.chatgpt.enabled then
                        return ''
                    else
                        return ''
                    end
                end, 'virtual' },
                { '  codeium ',   'virtual_bg' },
                {
                    function()
                        local status = vim.fn['codeium#GetStatusString']():lower()
                        if status:gsub("%s", "") == '' or status == nil or string.len(status) ~= 3 or string.find(status, 'on') ~= nil then
                            return ''
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
        green = { 'green', 'black' },
        red = { 'red', 'black' },
        blue = { 'blue', 'black' },
        magenta = { 'magenta', 'black' },
        yellow = { 'yellow', 'black' },
        virtual = { 'vgreen', 'black' },
        virtual_bg = { 'vgreen', 'black' }
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

-- local quickfix = {
--     filetypes = { 'qf', 'Trouble' },
--     active = {
--         { '🚦 Quickfix ',              { 'white', 'black' } },
--         { helper.separators.slant_right, { 'black', 'black_light' } },
--         {
--             function()
--                 return vim.fn.getqflist({ title = 0 }).title
--             end,
--             { 'cyan', 'black_light' },
--         },
--         { ' Total : %L ',                { 'cyan', 'black_light' } },
--         { helper.separators.slant_right, { 'black_light', 'InactiveBg' } },
--         { ' ',                           { 'InactiveFg', 'InactiveBg' } },
--         basic.divider,
--         { helper.separators.slant_right, { 'InactiveBg', 'black' } },
--         { '🧛 ',                       { 'white', 'black' } },
--     },
--     always_active = true,
--     show_last_status = true,
-- }

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
        magenta = { 'magenta', 'black' },
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
        basic.square_mode,
        basic.vi_mode,
        basic.file,
        basic.divider,
        basic.lsp_name,
        basic.lsp_diagnos,
        basic.genai,
        basic.divider,
        basic.file_right,
        basic.git,
        { git_comps.git_branch(), { 'vgreen', 'black' }, breakpoint_width },
        { ' ',                    hl_list.Black },
        basic.square_mode,
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
        colors.vgreen = '#0db9d7'
        colors.vgreen_bg = '#203346'

        return colors
    end,
    statuslines = {
        default,
        -- quickfix,
        explorer,
    },
})
