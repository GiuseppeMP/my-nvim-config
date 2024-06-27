return {
    { "Exafunction/codeium.vim" },
    {
        "jcdickinson/codeium.nvim",
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
                -- config_path = home .. "/.config/secrets/codeium_key.json"
            })
        end
    },
}
