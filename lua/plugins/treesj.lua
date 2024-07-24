return {
    'Wansmer/treesj',
    dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
    config = function()
        vim.keymap.set('n', '<leader>m', require('treesj').toggle)
        vim.keymap.set('n', '<leader>M', function() require('treesj').toggle({ split = { recursive = true } }) end)
    end,
}
