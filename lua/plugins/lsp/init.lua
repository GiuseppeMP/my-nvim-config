local function config()
    require 'plugins.lsp.lsp_setup'
end
return {
    {
        'neovim/nvim-lspconfig',
        config = config,
        lazy = false,
        dependencies = { 'mfussenegger/nvim-jdtls' }
    },
    { 'mfussenegger/nvim-jdtls', lazy = false },
    {
        'mrcjkb/rustaceanvim',
        version = '^5', -- Recommended
        ft = { 'rust' },
        lazy = false,
        -- ft = { 'rust' },
    },
    {
        "pmizio/typescript-tools.nvim",
        dependencies = { 'jose-elias-alvarez/null-ls.nvim', "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    },
}
