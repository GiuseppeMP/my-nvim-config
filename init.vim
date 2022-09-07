
" Highlight yanked text in vim
" Funcao que pisca o trecho copiado pelo yank
source $HOME/.config/nvim/vimrc_files/highlight_yank.func.vim

" Helper function Cond for Plugins/etc
" funcao que executa dependendo de uma condição, usada para carregar plugins
" dinamicamente.
source $HOME/.config/nvim/vimrc_files/cond_helper.func.vim

" .............................................................................
" Plugins Session using nvim/plugged.
" Sessão de plugins utilizando nvim/plugged.
" .............................................................................
call plug#begin('$HOME/.config/nvim/plugged')

" .............................................................................
" Plugin para comentar linhas.
" Plugin to easy comment lines.
Plug 'tpope/vim-commentary', Cond(!exists('g:vscode'))

" .............................................................................
" Plugin easymotion for VIM
Plug 'easymotion/vim-easymotion', Cond(!exists('g:vscode'))

" .............................................................................
" Plugin easymotion for vscode - as vsc-easymotion to avoid names conflicts
Plug 'asvetliakov/vim-easymotion', Cond(exists('g:vscode'), { 'as': 'vsc-easymotion' })

" .............................................................................
" Plugin sensible defaults for VIM
"Plug 'tpope/vim-sensible', Cond(!exists('g:vscode'))

" .............................................................................
" Plugin for powerline fonts
Plug 'powerline/powerline-fonts', Cond(!exists('g:vscode'))

" .............................................................................
" Plugin for add/remove surround like quotes, parantheses, brackets etc.
" Plugin para adicionar e remover chaves, paranteses etc em volta de algo.
Plug 'tpope/vim-surround'

" .............................................................................
" Repeat for plugins using dot command
" Plugin que consegue repetir comandos de plugins usando ponto (.)
Plug 'tpope/vim-repeat'

" .............................................................................
" Plugin for rainbow brackets and parentheses.
" Plugin que muda as cores dos parentheses e chaves.
Plug 'frazrepo/vim-rainbow', Cond(!exists('g:vscode'))
let g:rainbow_active=1

" .............................................................................
" Plugin for beauty status bar
" Plugin de status bar custom
Plug 'vim-airline/vim-airline', Cond(!exists('g:vscode'))

" .............................................................................
" Plugin for status bar additional themes
" Plugin com temas adicionais ao airline
Plug 'vim-airline/vim-airline-themes', Cond(!exists('g:vscode'))

" .............................................................................
" Plugin for customizable status bar additional themes
" Plugin para customizacoes adicionais da status bar
Plug 'itchyny/lightline.vim', Cond(!exists('g:vscode'))

" .............................................................................
" Themes collections
Plug 'rafi/awesome-vim-colorschemes', Cond(!exists('g:vscode'))

" .............................................................................
" Theme synthwave dedicated
" Tema dedicado ao synthwave84
Plug 'artanikin/vim-synthwave84', Cond(!exists('g:vscode'))
" .............................................................................
" Highlight f,F,t,T 
Plug 'unblevable/quick-scope', Cond(!exists('g:vscode'))
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']


" .............................................................................
"" NERD tree will be loaded on the first invocation of NERDTreeToggle command
Plug 'scrooloose/nerdtree', Cond(!exists('g:vscode'))

" .............................................................................
" Git fugitive, cli GIT by :G
Plug 'tpope/vim-fugitive', Cond(!exists('g:vscode'))

" .............................................................................
"" Plug para transformar funcoes em text objects (Java, c, vim scrips)
Plug 'kana/vim-textobj-user' ", Cond(!exists('g:vscode'))
"" Plug text-obj layer for functions
Plug 'kana/vim-textobj-function' ", Cond(!exists('g:vscode'))
"" Enhancement de sintaxe para text objects functions
Plug 'haya14busa/vim-textobj-function-syntax' ", Cond(!exists('g:vscode'))
"" Suporte text object para funcoes python
Plug 'bps/vim-textobj-python' ", Cond(!exists('g:vscode'))

" .............................................................................
" Plug for fzf, fzf installation is required, brew install fzf
" Plugin para usar fzf, necessario instalar brew install fzf
Plug 'junegunn/fzf', Cond(!exists('g:vscode'))
Plug 'junegunn/fzf.vim', Cond(!exists('g:vscode'))

" .............................................................................
" COC - conquer of completion
" Language server para auto completar sintax/validacoes/imports
Plug 'neoclide/coc.nvim', Cond(!exists('g:vscode'), {'branch': 'release'})

" .............................................................................
" Plugin markdown preview
Plug 'iamcco/markdown-preview.nvim', Cond(!exists('g:vscode'), { 'do': 'cd app && yarn install' })

" .............................................................................
" Plugin for snippets in different languages
Plug 'honza/vim-snippets', Cond(!exists('g:vscode'))

" .............................................................................
" Plugin for devicons
Plug 'ryanoasis/vim-devicons', Cond(!exists('g:vscode'))

" .............................................................................
" Plugin for sintax highlight languages
" Plug 'sheerun/vim-polyglot', Cond(!exists('g:vscode'))
" Plugin for sintax highlight languages
" Alternative for polyglot highlight using lua.
Plug 'nvim-treesitter/nvim-treesitter', Cond(!exists('g:vscode'),{'do': ':TSUpdate'})
" Plug for rainbow parentheses in treesitter highlight
Plug 'p00f/nvim-ts-rainbow', Cond(!exists('g:vscode'))

" .............................................................................
" Plugin for buffers as tabs in neovim
Plug 'kyazdani42/nvim-web-devicons', Cond(!exists('g:vscode')) " Recommended (for coloured icons)
Plug 'akinsho/bufferline.nvim', Cond(!exists('g:vscode'), { 'tag': 'v2.*' })

" .............................................................................
" Plug for typescript/highlight syntax
Plug 'HerringtonDarkholme/yats.vim', Cond(!exists('g:vscode'))
" Plug for react support
Plug 'maxmellon/vim-jsx-pretty', Cond(!exists('g:vscode'))
Plug 'https://github.com/tc50cal/vim-terminal', Cond(!exists('g:vscode')) " Vim Terminal

" .............................................................................
" Plug for tabgar outline
Plug 'preservim/tagbar', Cond(!exists('g:vscode'))
nmap <C-w><C-t> :TagbarToggle<CR>

" .............................................................................
" Plug Vim Only for make tests easy
" Plugin de testes para neovim
Plug 'roxma/nvim-yarp', Cond(!exists('g:vscode'))
Plug 'roxma/vim-hug-neovim-rpc', Cond(!exists('g:vscode'))
Plug 'vim-test/vim-test', Cond(!exists('g:vscode'))
" Plug 'GiuseppeMP/vim-test', Cond(!exists('g:vscode'), { 'branch': 'master' })

" Plug for tests neotest alternative for vim-ultest(deprecated)
" Plugin de testes alternativo ao vim-ultest que esta deprecated
" Plug 'rcarriga/vim-ultest', Cond(!exists('g:vscode'), { 'do': ':UpdateRemotePlugins' })
Plug 'nvim-neotest/neotest', Cond(!exists('g:vscode')) 
Plug 'nvim-neotest/neotest-vim-test', Cond(!exists('g:vscode')) 
Plug 'nvim-neotest/neotest-plenary', Cond(!exists('g:vscode')) 
Plug 'nvim-lua/plenary.nvim', Cond(!exists('g:vscode')) 
Plug 'antoinemadec/FixCursorHold.nvim', Cond(!exists('g:vscode')) 
Plug 'tpope/vim-projectionist', Cond(!exists('g:vscode')) 

" go test
nnoremap <Leader>gt :A<CR>

" .............................................................................
" Plug to debug with coc
" Plugin para debugar com coc
Plug 'puremourning/vimspector', Cond(!exists('g:vscode'))

" .............................................................................
" Plug for smoothie ctrl-d and ctrl-up scrolling
" Plugin para tornar ctrl-d e ctrl-u mais coconut oil
Plug 'psliwka/vim-smoothie', Cond(!exists('g:vscode'))

" .............................................................................
" Plug for float windows like fzf but for anything and vim-test
" Plugin para utilizar janelas flutuantes parecido com fzf, suportar vim-test
Plug 'voldikss/vim-floaterm', Cond(!exists('g:vscode'))

" .............................................................................
" Plug for dracula syntax highlight
" Plugin para suportar syntax com tema dracula
" Plug 'dracula/vim', Cond(!exists('g:vscode'), { 'as': 'dracula' })

call plug#end()

" .............................................................................
" Configuracoes gerais usadas tanto pelo vim quanto pelo vscode.
" General configurations used by both vscode and vim.
"
" [ VIM + VSCODE ]
" .............................................................................
nnoremap <Leader>ff :FloatermNew<CR>

" remove anything binded to spacebar
" remove todos binds da barra de espaço
nnoremap <SPACE> <Nop>
" muda o leader para <SPACE>
" map leader to <SPACE>
let g:mapleader=" "
let mapleader=" "
let maplocalleader=" "


" .............................................................................
" Nice cursor for different modes
let &t_SI.= "\e[5 q"
let &t_EI.= "\e[1 q"
                                               
" Compartilhar clipboard com yank/delete/change vim
" Share cliboard buffer with vim.
set clipboard=unnamedplus
set nolist
set autoindent
set autoread
set backspace=indent,eol,start

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
" Mapeamento outras opções para ESC
" Remap escape #begin
inoremap jk <Esc>
inoremap jj <Esc>

" .............................................................................
" TODO analise.
" Usando mouse com vim para copiar e colar.
" Using mouse to copy/paste in vim, with Y/D/C.
set mouse=a

" .............................................................................
" Configs sensible/commons
" Configs comuns
set termguicolors
set background=dark
set showmode " show mode, at ruler.
set hidden
set title
set number
set showcmd
set nobackup
set nowritebackup
set nowb
set noswapfile
set expandtab
set tabstop=4
set shiftwidth=4
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2
set cmdheight=2
set updatetime=1000
set shortmess+=c
set signcolumn=number
set encoding=UTF-8
set wm=5
nnoremap <esc> :noh<return><esc>
set scrolloff=5               " keep at least 5 lines above/below
set sidescrolloff=5           " keep at least 5 lines left/right
set history=200
set incsearch                 " incremental search
set ignorecase                " search ignoring case
set hlsearch                  " highlight the search
set showmatch                 " show matching bracket
if &compatible
  set nocompatible
endif
" .............................................................................
" Neovide configs
let g:neovide_cursor_vfx_mode = "railgun"

" .............................................................................
" Custom font.
set guifont=CaskaydiaCove\ Nerd\ Font:h15

" .............................................................................
" Manter o cursor centralizado.
" keep cursor centered.
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
nnoremap k kzz
nnoremap j jzz

" .............................................................................
" Undo breakpoints to not lost all writing with u/CR command.
" Criando breakpoints durante insert mode para utilizar com u/CR.
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap ( (<c-g>u
inoremap [ [<c-g>u
inoremap { {<c-g>u
inoremap { {<c-g>u

" .............................................................................
" Navigate around splits with a single key combo.
" Navegar entre os splits com uma hotkey
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-j> <C-w><C-j>
" Cycle through splits.
" alternar entre splits buffers.
nnoremap <S-Tab> <C-w>w

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

" .............................................................................
" viminspector config file.
source $HOME/.config/nvim/vimrc_files/vimspector.config.vim

" .............................................................................
" tree-sitter configs lua file. highlight sintax for java and etc
lua require("user.treesitter")
lua require("user.neotest")
nnoremap <silent> <Leader>t <Cmd>lua require("neotest").run.run()<CR>

" .............................................................................
" bufferline configs lua file. highlight sintax for java and etc
lua require("user.bufferline")

endif


" .............................................................................
" Load vscode configs from another file.
" Carrega as configs do vscode de outro arquivo.
"
" [ VSCODE ]
" .............................................................................
source $HOME/.config/nvim/vimrc_files/vscode.config.vim

