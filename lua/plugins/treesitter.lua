return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        event = 'VeryLazy'
    },

    -- text objects treesitter
    { 'nvim-treesitter/nvim-treesitter-textobjects' },

    -- text objects improved by subjects
    { 'RRethy/nvim-treesitter-textsubjects',         event = 'VeryLazy' },

    -- refactor module for tresitter
    { 'nvim-treesitter/nvim-treesitter-refactor',    event = 'VeryLazy' },

    -- comment string for multiple languages in the same buffer
    { 'JoosepAlviste/nvim-ts-context-commentstring', event = 'VeryLazy' },
}
