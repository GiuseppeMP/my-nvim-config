" Configs for vim-tests
" Configuracoes para o plugin vim-tests e vim-ultimate-tests
"
nmap <silent> <leader>t :UltestNearest<CR>
nmap <silent> <leader>tt :TestFile<CR>
nmap <silent> <leader>ta :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tg :TestVisit<CR>
nmap <silent> <leader>ts :UltestSummary<CR>

" make test commands execute using floaterm plugin
" fazer os testes rodarem dentro de terminais do plugin floaterm
let test#strategy = "floaterm"

" force test engine to be gradle
" forçar a engine para gradle quando o test for em java.
" let test#java#runner = 'gradletest'

" mappings to navigate throught the failing tests
" mapeamento de teclas para navegar entre os testes falhando
nmap ]t <Plug>(ultest-next-fail)
nmap [t <Plug>(ultest-prev-fail)

" config to enable PTY in tests
" config para habilitar a interação com os tests em PTY, ex: jest com watchALL
let g:ultest_use_pty = 1

