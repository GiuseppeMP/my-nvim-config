return { {
    'dhruvasagar/vim-table-mode',
    ft = { 'markdown', 'text', 'text', 'plaintext', 'norg' },
    config = function()
        vim.g.table_mode_disable_mappings = 1
    end
},
}
