# My nvim configs

## Install / Updates

1. Clone this repository in ~/.config/nvim.
2. Install vim-plug: https://github.com/junegunn/vim-plug
3. Open nvim and execute :PlugInstall to install all the plugins.
4. Execute :TSUpdateSync to download treesitter adapters.
5. Execute :CocUpdateSync to install coc extensions.
6. Enjoy! :)

Obs: You may use tmux to improve your workflow experience.

## Dependencies

* ripgrep -> https://github.com/BurntSushi/ripgrep
* asdf -> https://asdf-vm.com/
* Nerdfont to render symbols, ligatures and icons -> https://www.nerdfonts.com/

## Plugins Index and Modules

All the plugins are listed in a table in the "lua/user/plugins/install/_list.lua" module, this table is iterated
by "lua/user/plugins/install/with-vimplug.lua" and installed by vim-plug.

You may rewrite the with-vimplug.lua to install with your favorite plugin manager instead of
vim-plug.

The `name` property is the plugin itself.
The `cfg` property hold the vim-plug hooks and configs,.

This configuration use a set of plugins listed below in this README.

## 1. Treesitter (nvim-treesitter/nvim-treesitter)

https://github.com/tree-sitter/tree-sitter
https://github.com/nvim-treesitter/nvim-treesitter


