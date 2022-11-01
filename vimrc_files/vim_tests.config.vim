" Configs for vim-tests, neotest Test nearaest test
nnoremap <silent> <Leader>t <Cmd>lua require("neotest").run.run()<CR>

" run the file tests
nnoremap <silent> <Leader>tf <Cmd> lua require("neotest").run.run(vim.fn.expand("%"))<CR>

" run the neareast test with debug dap
nnoremap <silent> <Leader>td <Cmd> lua require("neotest").run.run({strategy = "dap"})<CR>

" change java debug test command
autocmd FileType java nnoremap <buffer> <silent> <Leader>td :TestDebugNearest<CR>

" change java debug test command
autocmd FileType java nnoremap <buffer> <silent> <Leader>ta :TestSuite<CR>

" nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>tt :TestFile<CR>
" nmap <silent> <leader>ta :TestSuite<CR>
" nmap <silent> <leader>tl :TestLast<CR>
" nmap <silent> <leader>tg :TestVisit<CR>

" make test commands execute using floaterm plugin
" fazer os testes rodarem dentro de terminais do plugin floaterm
let test#strategy = {
  \ 'nearest': 'asyncrun_background',
  \ 'file':    'floaterm',
  \ 'suite':   'floaterm',
  \ 'nearest-debug':   'asyncrun_background'
\}

let g:test#harpoon_term = 1

" force test engine to be gradle
" forçar a engine para gradle quando o test for em java.
" let test#java#runner = 'gradletest'

" mappings to navigate throught the failing tests
" mapeamento de teclas para navegar entre os testes falhando
" nmap ]t <Plug>(ultest-next-fail)
" nmap [t <Plug>(ultest-prev-fail)

" config to enable PTY in tests
" config para habilitar a interação com os tests em PTY, ex: jest com watchALL
let g:ultest_use_pty = 1

" projectionist
"nnoremap <Leader>gt :A<CR>


