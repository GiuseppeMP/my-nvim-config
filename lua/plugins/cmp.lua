return {
    -- cmp for autocompletion
    { 'hrsh7th/cmp-nvim-lsp' }, -- lsp completions
    { 'hrsh7th/cmp-buffer' },   -- buffer completions
    { 'hrsh7th/cmp-path' },     -- path completions
    { 'hrsh7th/cmp-cmdline' },  -- cmdline completions
    { 'hrsh7th/nvim-cmp' },     -- completion plugin
    -- cmp vsnip users
    -- {
    --     'hrsh7th/cmp-vsnip',
    --         lazy = false,
    --         config = lazy_rtp
    -- },
    -- {
    --     'hrsh7th/vim-vsnip',
    --         lazy = false,
    --         event = 'VeryLazy',
    --         config = lazy_rtp
    -- },
    -- cmp  luasnip users
    {
        'L3MON4D3/LuaSnip',
        version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        build = "make install_jsregexp"
    },
    { 'saadparwaiz1/cmp_luasnip' },
    -- cmp ultisnips users
    -- { 'SirVer/ultisnips' },
    -- { 'quangnguyen30192/cmp-nvim-ultisnips' },
    -- cmp snippy users
    { 'dcampos/nvim-snippy' },
    { 'dcampos/cmp-snippy' },
    -- cmp snippet collections
    { "rafamadriz/friendly-snippets" },
}
