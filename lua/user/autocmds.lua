vim.cmd([[
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
augroup END
]])

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = "*rc^",
    desc = "set syntax=sh to rc files like zshrc and bashrc and etc",
    command = "set syntax=sh"
})

vim.api.nvim_create_autocmd("InsertLeave", {
    pattern = "*",
    desc = "set nopaste when leaving insert mode, to avoid pasting in normal mode",
    command = "set nopaste"
})

vim.api.nvim_create_autocmd('FileType', {
    -- pattern = 'workspace.dsl',
    pattern = 'structurizr',
    callback = function()
        local client = vim.lsp.start({
            name = 'c4-language-server',
            cmd = { '/Users/giuseppemp/.config/packages/c4-dsl/c4-language-server/bin/c4-language-server' },
            root_dir = vim.fs.dirname(vim.fs.find({ 'workspace.dsl', ".git" }, { upward = true })[1]),
        })
        vim.lsp.buf_attach_client(0, client)
    end,
})
