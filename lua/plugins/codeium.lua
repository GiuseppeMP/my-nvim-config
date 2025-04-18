return {
    "Exafunction/codeium.nvim",
    event = 'VeryLazy',
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
    },
    config = function()
        vim.g.codeium_manual = true
        vim.g.codeium_disable_bindings = 1
        require("codeium").setup({

            virtual_text = {
                enabled = true,
                -- These are the defaults
                -- Set to true if you never want completions to be shown automatically.
                manual = false,
                -- A mapping of filetype to true or false, to enable virtual text.
                filetypes = {},
                -- Whether to enable virtual text of not for filetypes not specifically listed above.
                default_filetype_enabled = true,
                -- How long to wait (in ms) before requesting completions after typing stops.
                idle_delay = 80,
                -- Priority of the virtual text. This usually ensures that the completions appear on top of
                -- other plugins that also add virtual text, such as LSP inlay hints, but can be modified if
                -- desired.
                virtual_text_priority = 65535,
                -- Set to false to disable all key bindings for managing completions.
                map_keys = true,
                -- The key to press when hitting the accept keybinding but no completion is showing.
                -- Defaults to \t normally or <c-n> when a popup is showing.
                accept_fallback = nil,
                -- Key bindings for managing completions in virtual text mode.
                key_bindings = {
                    -- Accept the current completion.
                    accept = "<c-e>",
                    -- Accept the next word.
                    -- accept_word = "<c-w>",
                    -- Accept the next line.
                    -- accept_line = "<c-g>",
                    -- Clear the virtual text.
                    -- clear = "<c-x>",
                    -- Cycle to the next completion.
                    -- next = "<M-]>",
                    next = "<c-.>",
                    -- Cycle to the previous completion.
                    prev = "<c-,>",
                }
            },
            workspace_root = {
                use_lsp = true,
                find_root = nil,
                paths = {
                    ".bzr",
                    ".git",
                    ".hg",
                    ".svn",
                    "_FOSSIL_",
                    "package.json",
                    "pom.xml",
                }
            }
        })
    end
}
