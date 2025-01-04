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
            map_keys = true,
            enable_chat = true,
            workspace_root = {
                use_lsp = false,
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
