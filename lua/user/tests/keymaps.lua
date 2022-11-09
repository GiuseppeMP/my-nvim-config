local n = require'user.keymaps._utils'.n
local neotest = require 'neotest'

-- write buffer before run tests in order to execute a smooth tdd flow, if it was changed
-- escreve/salva o buffer antes de executar o teste, caso ele tenha sido alterado.
local function write_buffer()
    if vim.fn.getbufinfo('%')[1].changed == 1 then
        vim.cmd("write")
    end
end


-- default testing keymaps
n('<Leader>tt', ':TestFile<CR>')
n('<Leader>t' , ":lua require'neotest'.run.run()<CR>")
n('<Leader>tf' , ":lua require'neotest'.run.run(vim.fn.expand('%'))<CR>")
-- n('<Leader>tf', function() write_buffer() neotest(vim.fn.expand("%")) end)
n('<Leader>td', function() write_buffer() neotest({strategy = "dap"}) end)

-- alternates between test and code
-- alterna entre arquivo de testes e codigo
n('ga', function() write_buffer() vim.cmd(":A") end)

-- change keymaps based on buffer extesion
-- FIXME convert to autocmd on lua
vim.cmd([[
autocmd FileType java nnoremap <buffer> <silent> <Leader>td :TestDebugNearest<CR>

autocmd FileType java nnoremap <buffer> <silent> <Leader>ta :TestSuite<CR>
]])
