return {
    { 'lewis6991/async.nvim' },
    { 'lewis6991/gitsigns.nvim' },
    { 'mbbill/undotree' },
    -- Repeat plugins cmds using dot command
    -- Repetir os cmds dos plugins usando ponto
    { 'tpope/vim-repeat' },

    -- Powerline fonts for VIM
    -- Fonts powerline para VIM
    { 'powerline/powerline-fonts' },

    -- Fast comments using gcc or v(selection) gcc
    -- Comentarios rapidos atraves de gcc ou v(selecao)gcc
    { "tpope/vim-commentary" },


    -- auto close and auto rename xml, htmls tags
    { 'windwp/nvim-ts-autotag' },

    -- Rainbow in Treesitter
    -- { 'HiPhish/nvim-ts-rainbow2',                    event = 'VeryLazy' },
    { 'https://gitlab.com/HiPhish/rainbow-delimiters.nvim', event = 'VeryLazy' },

    -- close buffers without exit vim or messing layouts
    { 'moll/vim-bbye' },

    -- Plugins for VIM :colorscheme collections
    { 'rafi/awesome-vim-colorschemes' },
    { 'artanikin/vim-synthwave84' },
    { 'ryanoasis/vim-devicons' },
    { 'Mofiqul/dracula.nvim' },
    { 'mfussenegger/nvim-treehopper',                       dependencies = 'smoka7/hop.nvim' },
    -- new surround plugin use (sa for add surround, sd for delete surround)
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
    -- vim tests
    { 'kana/vim-vspec', },
    -- fix cursor in tests/debug
    { 'antoinemadec/FixCursorHold.nvim' },
    { 'voldikss/vim-floaterm' },
    { "SmiteshP/nvim-navic" },
    { 'kmonad/kmonad-vim' },
    { 'Eandrju/cellular-automaton.nvim' },
    { 'sindrets/diffview.nvim' },
    { "sotte/presenting.vim" },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {}
    },
    -- lsp kind icons
    { 'onsails/lspkind.nvim' },
    { 'skywind3000/asyncrun.vim' },
}
