# My nvim configs

> README in WIP...

*Read this in other languages: 🇺🇸[English](README.md), 🇧🇷[Portuguese](README.pt-br.md).*

Hello, I'm Giuseppe Matheus (Beppe). 👋

I created this configuration to help others achieve a full workflow using Neovim. I have tried NvChad, Alpha, and other configurations, but I always encounter the same problem: I struggle to understand their configuration architecture, and I feel unable to make changes without reading extensive documentation on how things are organized.

In the past, I wrote many configuration files, but now I want to share my experience with you. My goal is to keep things as simple as possible, so that any user who knows Lua and Neovim can make changes without heavy abstraction."

Let me know if you have any questions or suggestions, free to [open an issue](https://github.com/beppe-giuseppe/nvim-configs/issues/new?assignees=&labels=bug&template=bug_report.md).

## ✨ Features

* File explorer with `nvim-tree/nvim-tree.lua`
* Intuitive keymaps with `folke/which-key.nvim`

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

