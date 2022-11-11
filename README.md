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

