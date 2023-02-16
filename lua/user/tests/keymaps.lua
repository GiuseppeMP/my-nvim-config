local n = require'user.keymaps._utils'.n


-- FIXME convert to autocmd on lua
vim.cmd([[
autocmd FileType java nnoremap <buffer> <silent> <Leader>td :TestDebugNearest<CR>

autocmd FileType java nnoremap <buffer> <silent> <Leader>ta :TestSuite<CR>
]])
