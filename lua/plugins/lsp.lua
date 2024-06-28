return {
    { 'neovim/nvim-lspconfig',          opt = { inlay_hints = { enabled = true } } },
    { 'mfussenegger/nvim-jdtls' },
    { 'jose-elias-alvarez/null-ls.nvim' },
    {
        'mrcjkb/rustaceanvim',
        tag = '3.15.0', -- Recommended
        -- ft = { 'rust' },
    },
    {
        "pmizio/typescript-tools.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        opts = {},
    },
}
