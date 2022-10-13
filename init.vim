lua require("user.settings")

lua require("user.plugins")

lua require("user.keymaps")


" Verifica se init.vim foi carregado fora do VSCode.
" Verify if init.vim was not loaded by VSCode.
if (!exists('g:vscode'))

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


