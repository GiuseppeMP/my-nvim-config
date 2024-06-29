local function config()
    ---@diagnostic disable-next-line: unused-function, unused-local
    local function remove_keymap(mode, key, bufnr)
        -- safe set to avoid errors to del if not exists
        vim.keymap.set(mode, key, '', { buffer = bufnr })
        vim.keymap.del(mode, key, { buffer = bufnr })
    end

    local function my_on_attach(bufnr)
        local api = require "nvim-tree.api"

        local function opts(desc)
            return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        -- default mappings
        api.config.mappings.default_on_attach(bufnr)


        -- remove mappings
        -- remove_keymap('n', '<c-t>', bufnr)

        -- custom mappings
        -- vim.keymap.set('n', '<leader-e>', api.node.open.edit, opts('Open'))
        -- vim.keymap.set('n', '<leader>e', api.tree.tabnew, opts('Tab new'))
        vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))

        vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))

        print('nvim-tree my_on_attach')
    end
    local HEIGHT_RATIO = 0.9 -- You can change this
    local WIDTH_RATIO = 0.9  -- You can change this too

    -- :help nvim-tree-setup
    require 'nvim-tree'.setup {
        on_attach = my_on_attach,
        sort_by = "case_sensitive",
        sync_root_with_cwd = true,
        git = {
            ignore = false
        },
        diagnostics = {
            enable = true,
            show_on_dirs = true,
            icons = {
                hint = "",
                info = "",
                warning = "",
                error = "",
            },
        },
        notify = {
            threshold = vim.log.levels.OFF,
            absolute_path = true,
        },
        view = {
            float = {
                enable = false,
                quit_on_focus_loss = true,
                -- open_win_config = {
                --     relative = "editor",
                --     border = "rounded",
                --     width = 250,
                --     height = 50,
                --     row = 1,
                --     col = 1,
                -- },
                open_win_config = function()
                    local screen_w = vim.opt.columns:get()
                    local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
                    local window_w = screen_w * WIDTH_RATIO
                    local window_h = screen_h * HEIGHT_RATIO
                    local window_w_int = math.floor(window_w)
                    local window_h_int = math.floor(window_h)
                    local center_x = (screen_w - window_w) / 2
                    local center_y = ((vim.opt.lines:get() - window_h) / 2)
                        - vim.opt.cmdheight:get()
                    return {
                        border = "rounded",
                        relative = "editor",
                        row = center_y,
                        col = center_x,
                        width = window_w_int,
                        height = window_h_int,
                    }
                end,
            },
            width = {
                max = 50,
                min = 30
            },
            -- width = function()
            --     return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
            -- end,
        },
        renderer = {
            group_empty = true,
            indent_markers = {
                inline_arrows = true,
                enable = true
            },
            icons = {
                glyphs = {
                    git = {
                        untracked = "󱈸",
                        ignored = ""
                    }
                }
            }
        },

        filters = {
            dotfiles = false,
        },
        update_focused_file = {
            enable = true,
            update_root = true,
            ignore_list = {},
        },
    }

    local function open_nvim_tree(data)
        -- buffer is a directory
        local directory = vim.fn.isdirectory(data.file) == 1

        if not directory then
            return
        end

        -- create a new, empty buffer
        ---@diagnostic disable-next-line: undefined-field
        vim.cmd.enew()

        -- wipe the directory buffer
        ---@diagnostic disable-next-line: undefined-field
        vim.cmd.bw(data.buf)

        -- change to the directory
        ---@diagnostic disable-next-line: undefined-field
        vim.cmd.cd(data.file)

        -- open the tree
        require("nvim-tree.api").tree.open()
    end

    --- Open at startup
    vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })



    local colors = require("tokyonight.colors").setup()
    colors.vgreen = '#0db9d7'
    colors.vgreen_bg = '#203346'
    colors.dbg = '#222436'

    local NvimTreeColors = {
        NvimTreeFolderName = { fg = colors.bright_blue }, -- matching searching
        NvimTreeOpenedFileName = { fg = colors.yellow },  -- matching searching
        NvimTreeFileName = { fg = '#ffffff' },            -- matching searching
    }

    for hl, col in pairs(NvimTreeColors) do
        vim.api.nvim_set_hl(0, hl, col)
    end


    -- Events


    local java_rename = require("simaxme-java.rename")
    local utils = require("simaxme-java.rename.utils")

    local status, api = pcall(require, "nvim-tree.api")

    if not status then
        return
    end

    local Event = api.events.Event
    -- maybe needs to improve marks because multimodule projects (maven/gradle)
    local root_markers = { 'pom.xml', 'gradlew', 'mvnw', '.git', 'settings.gradle', '.lsp_root' }

    -- root dir, workspace and project name
    local get_root_dir = function() return require('jdtls.setup').find_root(root_markers) end

    --[[
    This function is used to rename java package when rename a folder.
    It will rename the package name in the java files and dependencies.
    Only if it is a java project
]]
    local java_package_rename = function(data)
        local regex = "%.java$"

        local old_name = data.old_name
        local new_name = utils.realpath(data.new_name)

        local is_dir = utils.is_dir(new_name)

        local root_dir = get_root_dir()

        if root_dir == nil then
            return
        end

        if is_dir then
            local files = utils.list_folder_contents_recursive(new_name)
            for _, file in ipairs(files) do
                local old_file = old_name .. "/" .. file
                local new_file = new_name .. "/" .. file

                local is_java_file = string.find(old_file, regex) ~= nil and string.find(new_file, regex) ~= nil
                local is_java_project = string.find(tostring(new_file), tostring(root_dir), 1, true) ~= nil

                if is_java_file and is_java_project then
                    java_rename.on_rename_file(old_file, new_file)
                end
            end
        end
    end

    -- [BETA] rename all .java on package folder rename
    api.events.subscribe(Event.NodeRenamed, function(data)
        java_package_rename(data)
    end)


    -- BEGIN_DEFAULT_MAPPINGS for easy access/reminder
    -- { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
    -- { key = "<C-e>",                          action = "edit_in_place" },
    -- { key = "O",                              action = "edit_no_picker" },
    -- { key = { "<C-]>", "<2-RightMouse>" },    action = "cd" },
    -- { key = "<C-v>",                          action = "vsplit" },
    -- { key = "<C-x>",                          action = "split" },
    -- { key = "<C-t>",                          action = "tabnew" },
    -- { key = "<",                              action = "prev_sibling" },
    -- { key = ">",                              action = "next_sibling" },
    -- { key = "P",                              action = "parent_node" },
    -- { key = "<BS>",                           action = "close_node" },
    -- { key = "<Tab>",                          action = "preview" },
    -- { key = "K",                              action = "first_sibling" },
    -- { key = "J",                              action = "last_sibling" },
    -- { key = "C",                              action = "toggle_git_clean" },
    -- { key = "I",                              action = "toggle_git_ignored" },
    -- { key = "H",                              action = "toggle_dotfiles" },
    -- { key = "B",                              action = "toggle_no_buffer" },
    -- { key = "U",                              action = "toggle_custom" },
    -- { key = "R",                              action = "refresh" },
    -- { key = "a",                              action = "create" },
    -- { key = "d",                              action = "remove" },
    -- { key = "D",                              action = "trash" },
    -- { key = "r",                              action = "rename" },
    -- { key = "<C-r>",                          action = "full_rename" },
    -- { key = "e",                              action = "rename_basename" },
    -- { key = "x",                              action = "cut" },
    -- { key = "c",                              action = "copy" },
    -- { key = "p",                              action = "paste" },
    -- { key = "y",                              action = "copy_name" },
    -- { key = "Y",                              action = "copy_path" },
    -- { key = "gy",                             action = "copy_absolute_path" },
    -- { key = "[e",                             action = "prev_diag_item" },
    -- { key = "[c",                             action = "prev_git_item" },
    -- { key = "]e",                             action = "next_diag_item" },
    -- { key = "]c",                             action = "next_git_item" },
    -- { key = "-",                              action = "dir_up" },
    -- { key = "s",                              action = "system_open" },
    -- { key = "f",                              action = "live_filter" },
    -- { key = "F",                              action = "clear_live_filter" },
    -- { key = "q",                              action = "close" },
    -- { key = "W",                              action = "collapse_all" },
    -- { key = "E",                              action = "expand_all" },
    -- { key = "S",                              action = "search_node" },
    -- { key = ".",                              action = "run_file_command" },
    -- { key = "<C-k>",                          action = "toggle_file_info" },
    -- { key = "g?",                             action = "toggle_help" },
    -- { key = "m",                              action = "toggle_mark" },
    -- { key = "bmv",                            action = "bulk_move" },
    -- }
    --
end
return { -- File explorer
    {
        'nvim-tree/nvim-tree.lua',
        config = config,
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        version = '*',
        lazy = false
    },
}
