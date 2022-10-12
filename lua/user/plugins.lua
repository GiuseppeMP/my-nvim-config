local plugins = {
    -- Repeat plugins cmds using dot command
    -- Repetir os cmds dos plugins usando ponto
    { name='tpope/vim-repeat' },

    -- Fast add, remove, or change word surrounds (cs,ys,ds)[motion][char]
    -- Atalho para add, alterar ou remover caracteres em volta das palavras.
    { name='tpope/vim-surround' },

    -- Powerline fonts for VIM
    -- Fonts powerline para VIM
    { name='powerline/powerline-fonts'},

    -- Powerfull navigation with <Leader><Leader>(Motion)
    -- Navegacao melhorada atraves de <Leader><Leader>(Motion)
    { name='easymotion/vim-easymotion'},

    -- Fast comments using gcc or v(selection) gcc
    -- Comentarios rapidos atraves de gcc ou v(selecao)gcc
    { name="tpope/vim-commentary"},


    -- Language server plugin but with better syntax highlight than coc
    -- Language server assim como coc mas com features melhores como syntaxh
    { name='nvim-treesitter/nvim-treesitter', cfg={ ['do'] =':TSUpdateSync'} },

    -- Rainbow in Treesitter
    { name='p00f/nvim-ts-rainbow'},

    -- Plugin for buffers as tabs
    -- Transforma os buffers em abas
    { name='akinsho/bufferline.nvim', cfg={ tag = 'v2.*' }},
    -- bufferline icons
    { name='kyazdani42/nvim-web-devicons'},

    -- Rainbow brackers and parentheses
    -- Chaves e parenteses arco-iris
    { name='frazrepo/vim-rainbow'},

    -- Plugins for beauty status bar
    -- Status bar personalizada
    { name='vim-airline/vim-airline'},
    { name='vim-airline/vim-airline-themes'},
    { name='itchyny/lightline.vim'},
    -- { name='dracula/vim', cfg = { as= 'dracula' }},

    -- Plugins for VIM :colorscheme collections
    -- Plugins para temas :colorscheme
    { name='rafi/awesome-vim-colorschemes'},
    { name='xolox/vim-misc'},
    { name='xolox/vim-colorscheme-switcher'},
    { name='artanikin/vim-synthwave84'},
    { name='ryanoasis/vim-devicons'},

    -- Trigger a highlight in the appropriate direction when pressing these keys: f, F, t, T
    -- Adiciona destaca aos possiveis pulos com f, F, t, T
    { name='unblevable/quick-scope' },

    -- File Explorer
    { name='scrooloose/nerdtree'},

    -- Git commands cli by :G (command)
    -- Interface git atraves de :G (comando)
    { name='tpope/vim-fugitive'},

    -- Fuzzy finder in VIM
    -- Usando Fuzzy Finder no VIM
    { name='junegunn/fzf'},
    { name='junegunn/fzf.vim'},


    { name='honza/vim-snippets'},
    { name='honza/vim-snippets'},

    -- COC - conquer of completion is a plugin like intelisense of vscode
    -- Language server plugin para auto completar sintax/validacoes/imports
    { name='neoclide/coc.nvim', cfg={ branch = 'release'}},

    -- Markdown Preview
    { name='iamcco/markdown-preview.nvim', cfg={ ['do']= 'cd app && yarn install' }},

    -- { name='HerringtonDarkholme/yats.vim'}, fixme
    -- { name='maxmellon/vim-jsx-pretty'}, fixme
    -- { name='https://github.com/tc50cal/vim-terminal'}, fixme

    -- Tagbar outline
    { name='preservim/tagbar'},


    -- { name='roxma/nvim-yarp'}, fixme
    -- { name='roxma/vim-hug-neovim-rpc'}, fixme

    -- Collection of plugins for tests, Debug and TDD
    { name='GiuseppeMP/vim-test', cfg={ branch= '#586-Question-How-to-configure-so-nvim-dap-is-used' } },
    { name='nvim-neotest/neotest'},
    { name='nvim-neotest/neotest-vim-test'},
    { name='nvim-neotest/neotest-plenary'},
    -- vim tests
    { name='kana/vim-vspec'},
    { name='nvim-lua/plenary.nvim'},
    -- fix cursor in tests/debug
    { name='antoinemadec/FixCursorHold.nvim'},
    -- go to test file
    { name='tpope/vim-projectionist'},
    -- debug
    { name='puremourning/vimspector'},
    { name='mfussenegger/nvim-dap'},

    -- Language server utils
    { name='neovim/nvim-lspconfig'},

    --Plug for mark files and terminals on the fly, to avoid repeat commands like
    --bnext, bprev, or fzf
    --Plug para marcar arquivos e terminais conforme precisar, para evitar uso
    --execesssivo de commandos como bnext, bprev e FZF
    { name='ThePrimeagen/harpoon'},


    -- Plug for smoothie ctrl-d and ctrl-up scrolling
    -- Plugin para tornar ctrl-d e ctrl-u mais coconut oil
    { name='psliwka/vim-smoothie'},

    -- Plug for float windows like fzf but for anything and vim-test
    -- Plugin para utilizar janelas flutuantes parecido com fzf, suportar vim-test
    { name='voldikss/vim-floaterm'},

    -- Plugin for snippets in different languages
    -- Plugin de snipptes (~)
    { name='SirVer/ultisnips' },
    { name='honza/vim-snippets'},

    -- Git buffer symbols
    { name='airblade/vim-gitgutter'},

    -- vim8, neovim async interface
    { name='skywind3000/asyncrun.vim'},

    -- { name='arafatamim/trouble.nvim'}, --fixme

    -- last index fixme
    { name=nil}
}

local function isempty(s)
  return s == nil or s == ''
end

local Plug = vim.fn['plug#']

vim.call('plug#begin', '$HOME/.config/nvim/plugged')

for k,v in pairs(plugins) do
    if not isempty(v.name) then
        if (isempty(v.cfg)) then
            Plug(v.name)
        else
            Plug(v.name, v.cfg)
        end
    end
end

vim.call('plug#end')

