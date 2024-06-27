return
{ -- markdown lint/sintax/hi
    {
        'preservim/vim-markdown',
        enabled = false,
        dependencies = { 'godlygeek/tabular' },
        branch = 'master',
        lazy = false,
        ft = "markdown",
        config = function()
            vim.g.vim_markdown_folding_disabled = 1
            vim.g.vim_markdown_new_list_item_indent = 1
        end
    },
}
