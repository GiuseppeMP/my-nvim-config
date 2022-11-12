# My nvim configs

## Install / Updates

1. Clone this repository in ~/.config/nvim.
2. [Install vim-plug](https://github.com/junegunn/vim-plug)
3. In nvim execute :PlugInstall
4. In nvim execute :TSUpdateSync to download treesitter adapters.
5. In nvim execute :CocUpdateSync to install coc extensions.
6. Enjoy! :)

Obs: You may use tmux to improve your workflow experience.

### ASDF ( Optional )

1. [Install asdf](https://asdf-vm.com/guide/getting-started.html)
2. Install Plugins Dependencies:
    - MacOS: `brew install gpg gawk`
    - Debian: `apt-get install dirmngr gpg curl gawk`

3. Add java plugin:

    `asdf plugin-add java https://github.com/halcyon/asdf-java.git`

4. Install Java Versions:

- `asdf java install corretto-11.0.16.9.1`
- `asdf java install zulu-14.29.23`
- `asdf java install corretto-17.0.4.9.1`
- `asdf java install corretto-8.342.07.1`

## Dependencies

- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [asdf](https://asdf-vm.com/)
- [nerdfonts](https://www.nerdfonts.com/) (For icons and ligatures.)

## Plugins Index and Modules

All plugins are listed in a table in the `lua/user/plugins/install/_list.lua`
module, this table is iterated by `lua/user/plugins/install/with-vimplug.lua`
and installed by vim-plug.

If you want, you may rewrite the `with-vimplug.lua` to install with your favorite
plugin manager instead of vim-plug.

- The `name` property is the plugin itself.
- The `cfg` property hold the vim-plug hooks and configs.

This configuration use a set of plugins listed in this README.



## Plugins

|  Name      |    description       |  docs  |
| ------------- |-------------  | ------- |
|    nvim-treesitter/nvim-treesitter    |     Tree-sitter is a parser generator tool and an incremental parsing library. It can build a concrete syntax tree for a source file and efficiently update the syntax tree as the source file is edited. | [github](https://github.com/nvim-treesitter/nvim-treesitter) |
| tpope/vim-repeat | Repeat plugins commands using dot | [github]() |
| tpope/vim-surround | Fast add, remove or change surronds | [github]() |
| powerline/powerline-fonts | Package of powerline fonts for nvim | [github]() |
| easymotion/vim-easymotion | Powerfull and precise navigation tool | [github]() |
| tpope/vim-commentary | Comments made easy | [github]() |
| p00f/nvim-ts-raindow  | Treesitter rainbow effect | [github]() |
| kyazdani42/nvim-web-devicons | Web Devicons | [github]() |
| moll/vim-bbye | Close buffers withouth accidently leaving vim | [github]() |
| akinsho/bufferline |  Niceee tabs | [github]() |
| vim-airline  | Beautiful and fully customizable status bar | [github]() |
| vim-airline-themes | Awesome status bar themes | [github]() |
| awesome-vim-colorscheme | Package of vim themes | [github]() |
| artanikin/vim-synthwave84 | I love synthwave84 sometings I switcht to it! | [github]() |
| vim-devicons | Devicons | [github]() |
| Mofiqul/dracula | A simple and awesome Dracula theme, for who likes. | [github]() |
| unblevable/quick-scope | Highlight jumps when using `F,f,t,T` | [github]() |
| scrooloose/nerdtree | A File Explorer | [github]() |
| tpope/vim-fugitive | All git commands available throught `:G` | [github]() |
| junegunn/fzf | Awesome fuzzy finder plugin | [github]() |
| nvim-telescope/telescope | Awesome fuzzy finder lists plugin | [github]() |
| honza/vim-snippets | Powerfull package of snippets | [github]() |
| neoclide/coc.vim | LSP Support, extensions, and more. | [github]() |
| iamcco/markdown-preview.nvim | Edit markdowns with livereload with `<C-m><C-m>` | [github]() |
| preservim/tagbar | A nice tagbar outline  | [github]() |
| nvim-lua/plenary.nvim | A nice lua library of utils functions | [github]() |
| vim-test/vim-test | Run tests in very different languages | [github]() |
| nvim-neotest/neotest | A new plugin for tests written in lua | [github]() |
| nvim-neotest/neotest-vim-test | An adapter to neotest use vim-test adapters | [github]() |
| nvim-neotest/neotest-plenary | Functions dependencies of neotest | [github]() |
| kana/vim-vspec | Testing framework for vim script | [github]() |
| antoinemadec/FixCursorHold.nvim | Fix some cursor interactions | [github]() |
| tpope/vim-projectionist | Alternate between to related files like code of implementation and tests | [github]() |
| puremourning/vimspector | Debugger interface for many adapters | [github]() |
| mfussenegger/nvim-dap | Debugger adapters for nvim | [github]() |
| neovim/nvim-lspconfig | Utilitary for LSP Configurations | [github]() |
| ThePrimeagen/harpoon | Nice marker file plugin, for fast navigation `ma`, `mm`| [github]() |
| psliwka/vim-smoothie | Make `C-d`, `C-up` smoothie for human eyes | [github]() |
| voldikss/vim-floaterm | Awesome floating terminals | [github]() |
| Sirver/ultisnips | Awesome package of snippets | [github]() |
| honza/vim-snippets | Another awesome package of snippets, but extensable. | [github]() |
| airblade/vim-gitgutter | Git status in signcolumn, very useful| [github]() |
|skywind3000/asyncrun.vim | Awesome interface to run background tasks | [github]() |
| christoomey/vim-tmux-navigator | Navigate between tmux terminals and neovim with `<C-l,k,j,h>` | [github]() |
| melkster/modicator | Highlight current number of the cursor line | [github]() |
| toppair/peek.nvim | Another awesome Markdown Previewer | [github]() |
| nat-418/boole.nvim | Rotate custom values like `false` <-> `true` using `<C-x,a>` | [github]() |
| Sorry for the long plugin list! | Here is a potato:🥔 | [github]() |
