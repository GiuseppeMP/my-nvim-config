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
    remove_keymap('n', '<c-t>', bufnr)

    -- custom mappings
    -- vim.keymap.set('n', '<leader>e', api.tree.tabnew, opts('Tab new'))
    vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))

    vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
end


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
    view = {
        float = {
            enable = false,
            quit_on_focus_loss = true,
            open_win_config = {
                relative = "editor",
                border = "rounded",
                width = 50,
                height = 50,
                row = 1,
                col = 1,
            },
        },
        width = {
            max = 50,
            min = 30
        },
    },
    renderer = {
        group_empty = true,
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
        update_root = false,
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
    vim.cmd.enew()

    -- wipe the directory buffer
    vim.cmd.bw(data.buf)

    -- change to the directory
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
