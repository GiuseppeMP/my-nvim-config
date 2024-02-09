vim.cmd([[
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
augroup END
]])

vim.cmd([[
augroup twig_ft
  au!
  autocmd BufNewFile,BufRead *rc  set syntax=sh
augroup END
]])

vim.api.nvim_create_autocmd("InsertLeave", {
    pattern = "*",
    command = "set nopaste"
})
