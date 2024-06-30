return {
    { 'lewis6991/async.nvim',                               enabled = false },
    { 'mbbill/undotree' },
    { 'tpope/vim-repeat' },
    { 'powerline/powerline-fonts' },
    { "tpope/vim-commentary",                               enabled = false },
    { 'windwp/nvim-ts-autotag' },
    -- { 'HiPhish/nvim-ts-rainbow2',                    event = 'VeryLazy' },
    { 'https://gitlab.com/HiPhish/rainbow-delimiters.nvim', event = 'VeryLazy' },
    { 'moll/vim-bbye' },
    { 'rafi/awesome-vim-colorschemes' },
    { 'artanikin/vim-synthwave84' },
    { 'ryanoasis/vim-devicons' },
    { 'Mofiqul/dracula.nvim' },
    { 'mfussenegger/nvim-treehopper',                       dependencies = 'smoka7/hop.nvim' },
    {
        'echasnovski/mini.surround',
        version = '*',
        config = function() require('mini.surround').setup() end
    },
    {
        'nvim-pack/nvim-spectre',
        config = function() require('spectre').setup() end,
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { 'tpope/vim-fugitive' },
    { 'nvim-lua/plenary.nvim', },
    { 'kana/vim-vspec', },
    { 'voldikss/vim-floaterm' },
    { 'kmonad/kmonad-vim' },
    { 'Eandrju/cellular-automaton.nvim' },
    { 'sindrets/diffview.nvim' },
    { "sotte/presenting.vim" },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {}
    },
    { 'onsails/lspkind.nvim' },
    { 'skywind3000/asyncrun.vim' },
}
