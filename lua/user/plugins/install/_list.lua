-- Module that returns the list of the vim plugins that must be installed.
-- Modulo que retorna a lista de vim plugins que precisam ser instalados.
-- You can manage your plugins here, separated from plugin manager.
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

    -- text objects treesitter
    { name='nvim-treesitter/nvim-treesitter-textobjects' },

    -- refactor module for tresitter
    { name='nvim-treesitter/nvim-treesitter-refactor' },

    -- comment string for multiple languages in the same buffer
    { name='JoosepAlviste/nvim-ts-context-commentstring' },

    -- better context, for long functions
    { name='romgrk/nvim-treesitter-context' },

    -- auto close and auto rename xml, htmls tags
    { name='windwp/nvim-ts-autotag' },


    -- Rainbow in Treesitter
    { name='p00f/nvim-ts-rainbow'},

    -- bufferline icons
    { name='kyazdani42/nvim-web-devicons'},

    -- close buffers without exit vim or messing layouts
    -- fechar buffers sem perder config de layout ou acabar saindo do nvim sem querer
    { name='moll/vim-bbye'},

    -- Plugin for buffers as tabs
    -- Transforma os buffers em abas
    { name='akinsho/bufferline.nvim', cfg={ tag = 'v3.*' }},

    -- Rainbow brackers and parentheses
    -- Chaves e parenteses arco-iris
    { name='frazrepo/vim-rainbow'},

    -- Plugins for beauty status bar
    -- Status bar personalizada
    { name='vim-airline/vim-airline'},
    { name='vim-airline/vim-airline-themes'},
    -- { name='itchyny/lightline.vim'},

    -- Plugins for VIM :colorscheme collections
    -- Plugins para temas :colorscheme
    { name='rafi/awesome-vim-colorschemes'},
    { name='artanikin/vim-synthwave84'},
    { name='ryanoasis/vim-devicons'},
    { name='Mofiqul/dracula.nvim'},

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
    { name='junegunn/fzf', cfg={ ['do'] = 'fzf#install()'}},

    -- Fuzzy finder written in lua
    { name = 'nvim-telescope/telescope.nvim', cfg ={ tag = '0.1.0' }},

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
    { name='nvim-lua/plenary.nvim'},
    { name= 'vim-test/vim-test'},
    -- { name='GiuseppeMP/vim-test', cfg={ branch= '#586-Question-How-to-configure-so-nvim-dap-is-used' } },
    { name='nvim-neotest/neotest'},
    { name='nvim-neotest/neotest-vim-test'},
    { name='nvim-neotest/neotest-plenary'},
    -- vim tests
    { name='kana/vim-vspec'},
    -- fix cursor in tests/debug
    { name='antoinemadec/FixCursorHold.nvim'},
    -- go to test file
    { name='tpope/vim-projectionist'},
    -- debug
    { name='puremourning/vimspector'},


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

    -- tmux <-> neovim navigation using C-l,k,j,h
    { name='christoomey/vim-tmux-navigator'},

    -- { name='arafatamim/trouble.nvim'}, --fixme

    -- Plugin for custom text objects (disabled because coc)
    -- { name='kana/vim-textobj-user' }, fixme
    -- { name='kana/vim-textobj-function' }, fixme
    -- { name='haya14busa/vim-textobj-function-syntax' }, fixme
    -- { name='bps/vim-textobj-python' }, fixme
    --
    -- linenumber mode indicator
    { name='melkster/modicator.nvim'},

    -- Markdown preview
    { name = 'toppair/peek.nvim'},

    -- toggle custom values
    { name = 'nat-418/boole.nvim'},

    -- display images in buffer
    { name = 'edluffy/hologram.nvim'},

    -- lsp tools
    -- Language server utils
    -- Debug servers
    { name = 'williamboman/mason.nvim' },
    { name = 'williamboman/mason-lspconfig.nvim'},
    { name = 'WhoIsSethDaniel/mason-tool-installer.nvim'},
    { name = 'neovim/nvim-lspconfig'},

    { name = 'mfussenegger/nvim-dap'},
    { name = 'mfussenegger/nvim-jdtls'},
    { name = 'jayp0521/mason-nvim-dap.nvim'},
    { name = 'rcarriga/nvim-dap-ui'},

    { name = 'jose-elias-alvarez/null-ls.nvim'},
    { name = 'mfussenegger/nvim-dap-python' },

    -- Debug tests python
    { name = 'nvim-neotest/neotest-python' },

    -- Debug tests python
    { name = 'nvim-tree/nvim-tree.lua' },

    { name = 'startup-nvim/startup.nvim' },
}

return plugins
