local function config()
    require 'plugins.lsp.lsp_setup'
end
return {
    {
        'neovim/nvim-lspconfig',
        config = config,
        opt = { inlay_hints = { enabled = true } },
        dependencies = { 'mfussenegger/nvim-jdtls' }
    },
    { 'mfussenegger/nvim-jdtls' },
    -- { 'GiuseppeMP/nvim-jdtls' },
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
