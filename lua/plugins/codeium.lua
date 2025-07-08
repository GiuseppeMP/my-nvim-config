return {
    -- "Exafunction/codeium.nvim",
    "Exafunction/windsurf.nvim",
    event = 'BufEnter',
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
    },
    config = function()
        vim.g.codeium_manual = true
        vim.g.codeium_disable_bindings = 1
        require("codeium").setup({
            enable_cmp_source = false,
            virtual_text = {
                enabled = true,
                manual = true,
                -- filetypes = { 'java', 'javascript' },
                default_filetype_enabled = true,
                idle_delay = 100,
                virtual_text_priority = 65535,
                map_keys = true,
                accept_fallback = "<Tab>",
                key_bindings = {
                    accept = "<c-e>",
                    next = "<c-.>",
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
                    "_fossil_",
                    "package.json",
                    "pom.xml",
                }
            }
        })
    end
}
