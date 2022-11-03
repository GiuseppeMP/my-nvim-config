local u = require'user.keymaps._utils'
local n = u.n
local neotest = require 'neotest'


-- write buffer before run tests in order to execute a smooth tdd flow
local function write_buffer()
    vim.cmd("write")
end

-- default testing keymaps
n('<Leader>tt', ':TestFile<CR>')
n('<Leader>t' , function() write_buffer() neotest.run.run() end)
n('<Leader>tf', function() write_buffer() neotest.run.run(vim.fn.expand("%")) end)
n('<Leader>td', function() write_buffer() neotest.run.run({strategy = "dap"}) end)


-- change keymaps based on buffer extesion
-- FIXME convert to autocmd on lua
vim.cmd([[
autocmd FileType java nnoremap <buffer> <silent> <Leader>td :TestDebugNearest<CR>

autocmd FileType java nnoremap <buffer> <silent> <Leader>ta :TestSuite<CR>
]])
