local u = require'user.keymaps._utils'
local n = u.n


-- default testing keymaps
n('<Leader>tt', ':TestFile<CR>')
n('<Leader>t', function() require('neotest').run.run() end)
n('<Leader>tf', function() require('neotest').run.run(vim.fn.expand("%")) end)
n('<Leader>td', function() require('neotest').run.run({strategy = "dap"}) end)


-- change keymaps based on buffer extesion
vim.cmd([[
autocmd FileType java nnoremap <buffer> <silent> <Leader>td :TestDebugNearest<CR>

autocmd FileType java nnoremap <buffer> <silent> <Leader>ta :TestSuite<CR>
]])
