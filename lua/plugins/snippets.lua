local lazy_rtp = function(plugin)
    ---@diagnostic disable-next-line: undefined-field
    vim.opt.rtp:append(plugin.dir)
end

return { {
    'honza/vim-snippets',
    config = lazy_rtp
},
    {
        'stevearc/vim-vscode-snippets'
    },
}
