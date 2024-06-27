local config = function()
    require('telescope').load_extension('harpoon')
    require("telescope").load_extension('scope')
    require("telescope").load_extension('zoxide')
    require("telescope").load_extension('lsp_handlers')
    require("telescope").load_extension('neoclip')

    local actions = require("telescope.actions")

    require("telescope").setup {
        extensions = {
            lsp_handlers = {
                code_action = {
                    telescope = require('telescope.themes').get_dropdown({}),
                    no_results_message = 'No code actions available',
                },
            },
        },
        defaults = {
            prompt_prefix = "  ",
            selection_caret = " ",
            path_display = { "smart" },
            -- prompt_prefix = "❯ ",
            -- selection_caret = "❯ ",
            preview = {
                timeout = 500,
                msg_bg_fillchar = " ",
            },
            multi_icon = " ",
            vimgrep_arguments = {
                "rg",
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                "--smart-case",
                "--hidden",
            },
            sorting_strategy = "ascending",
            color_devicons = true,
            layout_config = {
                prompt_position = "bottom",
                horizontal = {
                    width_padding = 0.04,
                    height_padding = 0.1,
                    preview_width = 0.6,
                },
                vertical = {
                    width_padding = 0.05,
                    height_padding = 1,
                    preview_height = 0.5,
                },
            },
            mappings = {
                i = {
                    ["<C-j>"] = actions.cycle_history_next,
                    ["<C-k>"] = actions.cycle_history_prev,

                    ["<C-n>"] = actions.move_selection_next,
                    ["<C-p>"] = actions.move_selection_previous,
                    ["<C-c>"] = actions.close,

                    ["<Down>"] = actions.move_selection_next,
                    ["<Up>"] = actions.move_selection_previous,

                    ["<CR>"] = actions.select_default,
                    ["<C-x>"] = actions.select_horizontal,
                    ["<C-v>"] = actions.select_vertical,
                    ["<C-t>"] = actions.select_tab,

                    ["<C-u>"] = actions.preview_scrolling_up,
                    ["<C-d>"] = actions.preview_scrolling_down,

                    ["<PageUp>"] = actions.results_scrolling_up,
                    ["<PageDown>"] = actions.results_scrolling_down,

                    ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                    ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                    ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                    ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                    ["<C-l>"] = actions.complete_tag,
                    ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
                }
            }
        },
        pickers = {
            buffers = {
                theme = "ivy",
                show_all_buffers = true,
                sort_mru = true,
                mappings = {
                    i = {
                        ["<c-d>"] = "delete_buffer",
                    },
                },
            },
            git_branches = {
                theme = "dropdown",
            },
            diagnostics = {
                theme = "ivy",
            },
            git_commits = {
                theme = "ivy",
            },
            quickfix = {
                theme = "ivy",
            },
            lsp_references = {
                theme = "ivy",
            },
            lsp_implementations = {
                theme = "ivy",
            },
            lsp_definitions = {
                theme = "ivy",
            },
            lsp_incoming_calls = {
                theme = "ivy",
            },
            lsp_outgoing_calls = {
                theme = "ivy",
            },
            lsp_type_definitions = {
                theme = "ivy",
            },
        }
    }

    -- fix issue https://github.com/nvim-telescope/telescope.nvim/issues/2027 introduced by neovim >= 0.9.0
    vim.api.nvim_create_autocmd("WinLeave", {
        callback = function()
            if vim.bo.ft == "TelescopePrompt" and vim.fn.mode() == "i" then
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "i", false)
            end
        end,
    })


    local colors = require("tokyonight.colors").setup()
    colors.vgreen = '#0db9d7'
    colors.vgreen_bg = '#203346'
    -- colors.dbg = '#222436'
    -- transparent
    colors.bg = 'none'
    colors.dbg = 'none'

    local TelescopeColor = {

        TelescopeMatching = { fg = colors.yellow },                                           -- matching searching
        TelescopeSelection = { fg = colors.vgreen, bg = colors.vgreen_bg, bold = true },      --
        TelescopeSelectionCaret = { fg = colors.yellow, bg = colors.vgreen_bg, bold = true }, --

        TelescopePreviewBorder = { fg = colors.yellow },
        TelescopePreviewNormal = { bg = colors.dbg },
        TelescopePreviewTitle = { fg = colors.yellow },

        TelescopeResultsBorder = { fg = colors.dbg },
        TelescopeResultsTitle = { fg = colors.vgreen },
        TelescopeResultsNormal = { bg = colors.bg },

        TelescopePromptTitle = { fg = colors.red },
        TelescopePromptBorder = { fg = colors.dbg },
        TelescopePromptNormal = { bg = colors.bg, fg = colors.fg },
        TelescopePromptPrefix = { bg = colors.none, fg = colors.blue },
        TelescopePromptCounter = { bg = colors.bg, fg = colors.red },

        -- TelescopeMultiselection = { bg = colors.bg, fg = colors.yellow },

        TelescopeNormal = { bg = colors.dbg },

    }

    for hl, col in pairs(TelescopeColor) do
        vim.api.nvim_set_hl(0, hl, col)
    end
end
return

{
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    config = config
}
