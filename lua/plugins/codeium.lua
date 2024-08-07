return {
    {
        "Exafunction/codeium.vim",
        event = 'BufEnter',
    },
    {
        "jcdickinson/codeium.nvim",
        enabled = true,
        event = 'VeryLazy',
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
        },
        cond = function() return conf.user.codeium.enabled end,
        config = function()
            vim.g.codeium_manual = true
            vim.g.codeium_disable_bindings = 1
            ---@diagnostic disable-next-line: different-requires
            require("codeium").setup({
                enable_chat = true
            })
        end
    },
}
