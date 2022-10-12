
" vim settings
lua require("user.settings")

" plugins stuff
lua require("user.plugins")

" vim keybinds
lua require("user.keymaps")

" rainbow
let g:rainbow_active=1

" quick-scope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" tagbar
nmap <C-w><C-t> :TagbarToggle<CR>

" projectionist
"nnoremap <Leader>gt :A<CR>

"" .............................................................................
"" Plug for mapping text objects of languages (maybe replaced by coc)
""" Plug para transformar funcoes em text objects (Java, c, vim scrips)
"Plug 'kana/vim-textobj-user' ", Cond(!exists('g:vscode'))
""" Plug text-obj layer for functions
"Plug 'kana/vim-textobj-function' ", Cond(!exists('g:vscode'))
""" Enhancement de sintaxe para text objects functions
"Plug 'haya14busa/vim-textobj-function-syntax' ", Cond(!exists('g:vscode'))
""" Suporte text object para funcoes python
"Plug 'bps/vim-textobj-python' ", Cond(!exists('g:vscode'))

" .............................................................................
" Configuracoes gerais usadas tanto pelo vim quanto pelo vscode.
" General configurations used by both vscode and vim.
"
" [ VIM + VSCODE ]
" .............................................................................
nmap <c-f><c-f> :FloatermNew<CR>

" .............................................................................
" Nice cursor for different modes
let &t_SI.= "\e[5 q"
let &t_EI.= "\e[1 q"
                                               
" .............................................................................
" Configuracoes utilizadas somente pelo VIM
" General configurations that can be only loaded by VIM.
"
" [VIM]
" .............................................................................

" Verifica se init.vim foi carregado fora do VSCode.
" Verify if init.vim was not loaded by VSCode.
if (!exists('g:vscode'))

" .............................................................................
" Neovide configs
let g:neovide_cursor_vfx_mode = "railgun"

" .............................................................................
" Nerdtree Plugin config file.
source $HOME/.config/nvim/vimrc_files/nerdtree.config.vim

" .............................................................................
" FZF Plugin config file.
source $HOME/.config/nvim/vimrc_files/fzf.config.vim

" .............................................................................
" vim/comentary config file.
source $HOME/.config/nvim/vimrc_files/vim_commentary.config.vim

" .............................................................................
" vim-easymotion config file.
source $HOME/.config/nvim/vimrc_files/vim_easymotion.config.vim

" .............................................................................
" airline config file.
source $HOME/.config/nvim/vimrc_files/vim_airline.config.vim

" .............................................................................
" awesome themes config file.
source $HOME/.config/nvim/vimrc_files/vim_awesome_themes.config.vim

" .............................................................................
" coc config
source $HOME/.config/nvim/vimrc_files/coc.config.vim

" .............................................................................
" bufferline tabs config file.
source $HOME/.config/nvim/vimrc_files/bufferline_tabs.config.vim

" .............................................................................
" vim-test config file.
source $HOME/.config/nvim/vimrc_files/vim_tests.config.vim

" nvim-dap config file
source $HOME/.config/nvim/vimrc_files/nvim_dap.config.vim

" .............................................................................
" viminspector config file.
source $HOME/.config/nvim/vimrc_files/vimspector.config.vim

" .............................................................................
" tree-sitter configs lua file. highlight sintax for java and etc
lua require("user.treesitter")
lua require("user.neotest")

" .............................................................................
" bufferline configs lua file. highlight sintax for java and etc
lua require("user.bufferline")

" .............................................................................
" harpoon config lua file. mark files and terminals for faster navigation
lua require("user.harpoon")
" harpoon vim keybinds file


source $HOME/.config/nvim/vimrc_files/harpoon_keybinds.vim

endif


" .............................................................................
" Load vscode configs from another file.
" Carrega as configs do vscode de outro arquivo.
"
" [ VSCODE ]
" .............................................................................
source $HOME/.config/nvim/vimrc_files/vscode.config.vim


let g:gitgutter_set_sign_backgrounds = 1
highlight GitGutterAdd    guifg=#009900 ctermfg=Green
highlight GitGutterChange guifg=#bbbb00 ctermfg=Yellow
highlight GitGutterDelete guifg=#ff2222 ctermfg=Red


