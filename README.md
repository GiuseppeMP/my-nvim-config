# My nvim configs

> README in WIP...

*Read this in other languages: 🇺🇸[English](README.md), 🇧🇷[Portuguese](README.pt-br.md).*

Hello, I'm Giuseppe Matheus (Beppe) a software engineer from Brazil. 👋

I created this configuration to help others achieve a full workflow using Neovim. I have tried NvChad, Alpha, and other configurations, but I always encounter the same problem: I struggle to understand their configuration architecture, and I feel unable to make changes without reading extensive documentation on how things are organized.

In the past, I wrote many configuration files, but now I want to share my experience with you. My goal is to keep things as simple as possible, so that any user who knows Lua and Neovim can make changes without heavy abstraction."

I work daily with Python, Java, Lua, Golang, Javascript, Typescript, HTML/YAML/Json/XML, Markdown, Terraform, Ansible, and Shell.

Let me know if you have any questions, other lsp help, or suggestions, free to [open an
issue](https://github.com/GiuseppeMP/my-nvim-config/issues/new).

## ✨ Features

* Outstanding colorscheme Tokyonight based with `folke/tokyonight.nvim`
* File explorer with `nvim-tree/nvim-tree.lua` | `<leader>e`
* Intuitive keymaps feedback with `folke/which-key.nvim` | `<leader>fk`
* Repeat commands and plugins with `tpope/vim-repeat` | `.`
* Open what is cursor with system default with `chrishrb/gx.nvim` | `gx`
* Fast surround tasks with `tpope/vim-surround` | `ys, cs, ds [motion]`
* Powerline fonts with `powerline/fonts`
* Awesome commentary engine with `tpope/vim-commentary` | `gcc`
* Powerful Parser and Syntax Highlighting with `nvim-treesitter/nvim-treesitter`
* Extended text object with `nvim-treesitter/nvim-treesitter-textobjects`
* Improved text objects by context with `nvim-treesitter/nvim-treesitter-textsubjects`
* Highlighting under cursor and smart renames with `nvim-treesitter/nvim-treesitter-refactor`
* Awesome commentary improved able to change the comment type based on cursor position with `JoosepAlviste/nvim-ts-context-commentstring`
* Nice context always visible with `romgrk/nvim-treesitter-context`
* Powerful autoclose and rename xml/htmls tags with `windwp/nvim-ts-autotag`
* Nice rainbow parentheses and more with `HiPhish/nvim-ts-rainbow2`
* Handful keymaps for close and handle buffers with `moll/vim-bbye`
* Amazing tabs and more with `akinsho/bufferline.nvim`
* Full customizable statusline with `windwp/windline.nvim`
* Git integration with `tpope/vim-fugitive`
* Full fuzzy file finder with `nvim-telescope/telescope.nvim`

[wip] continue...


## ⚡️ Dependencies and Requirements

* Neovim >= 0.9.0
* macOS (`homebrew`)
* macOS (`open`), Linux (`xdg-open`) or Windows (`powershell.exe start explorer.exe`)

This configuration has plugins that relies on some external things.

### 🍺 Homebrew Packages

```
brew install safe-rm
```

## Language Server, Linters, DAPs and Formatters

You can install by yourself, but I recommend using asdf.

You can install any of these things using `:Mason`.

The list of the LSP's supported by `Mason` is documented at [LSP Configurations](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)

Depending which LSP you want to use, you can install the language binaries using `asdf`

### Download and Install asdf

[asdf](https://asdf-vm.com/guide/getting-started.html#_2-download-asdf)

### Install asdf java plugin and JDKs for `nvim-jdtls` and `jdtls`

```
asdf plugin-add java https://github.com/halcyon/asdf-java.git
asdf install java corretto-8.342.07.1
asdf install java corretto-11.0.16.9.1
asdf install java zulu-14.29.23
asdf install java corretto-17.0.4.9.1
asdf install java corretto-19.0.2.7.1
```

