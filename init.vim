lua require("user.settings")

lua require("user.keymaps")

lua require("user.plugins")

lua require("user.colorscheme")

" .............................................................................
source $HOME/.config/nvim/vimrc_files/highlight_yank.func.vim

highlight GitGutterAdd    guifg=#009900 ctermfg=Green
highlight GitGutterChange guifg=#bbbb00 ctermfg=Yellow
highlight GitGutterDelete guifg=#ff2222 ctermfg=Red
