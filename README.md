# My nvim configs

*Read this in other languages: 🇺🇸[English](README.md), 🇧🇷[Portuguese](README.pt-br.md).*

Hello, I'm Giuseppe Matheus (Beppe). 👋

> README in WIP...

## ✨ Features

* File explorer with `nvim-tree/nvim-tree.lua`
* Intuitive keymaps with `folke/which-key.nvim`

## ⚡️ Dependencies and Requirements

* Neovim >= 0.9.0
* macOS (`open`), Linux (`xdg-open`) or Windows (`powershell.exe start explorer.exe`)

This configuration has plugins relies on some external things.

### Homebrew Packages

```
brew install safe-rm
```

### Download and Install asdf

[asdf](https://asdf-vm.com/guide/getting-started.html#_2-download-asdf)

### Install asdf java plugin and JDKs

```
asdf plugin-add java https://github.com/halcyon/asdf-java.git
asdf install java corretto-8.342.07.1
asdf install java corretto-11.0.16.9.1
asdf install java zulu-14.29.23
asdf install java corretto-17.0.4.9.1
asdf install java corretto-19.0.2.7.1
```

You can install by yourself, but I recommend using asdf.


## Language Server, Linters, DAPs and Formatters

You can install any of these things using `:Mason`.

The list of the LSP's supported by `Mason` is documented at [LSP Configurations](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)


