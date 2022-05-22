" Highlight yanked text built in neovim
if (!exists('g:vscode'))

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
augroup END


endif

