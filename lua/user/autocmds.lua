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
