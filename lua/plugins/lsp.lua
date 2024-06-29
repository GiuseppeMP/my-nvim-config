return {
    { 'neovim/nvim-lspconfig',  opt = { inlay_hints = { enabled = true } } },
    { 'mfussenegger/nvim-jdtls' },
    {
        'mrcjkb/rustaceanvim',
        tag = '3.15.0', -- Recommended
        -- ft = { 'rust' },
    },
    {
        "pmizio/typescript-tools.nvim",
        dependencies = { 'jose-elias-alvarez/null-ls.nvim', "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        opts = {},
    },
}
