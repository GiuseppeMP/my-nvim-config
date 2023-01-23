-- plugins description pls see "plugins._list.lua"

-- install module
require "user.plugins.install.with-vimplug"

-- configs modules
require "user.plugins.configs.airline"
require "user.plugins.configs.boole"
require "user.plugins.configs.bufferline"
require "user.plugins.configs.coc"
require "user.plugins.configs.dap"
require "user.plugins.configs.dracula"
require "user.plugins.configs.fzf"
require "user.plugins.configs.gitgutter"
require "user.plugins.configs.harpoon"
require "user.plugins.configs.hologram"
require "user.plugins.configs.mason"
require "user.plugins.configs.modicator"
require "user.plugins.configs.neotest"
require "user.plugins.configs.nerdtree"
require "user.plugins.configs.nvimtree"
require "user.plugins.configs.projectionist"
require "user.plugins.configs.short_configs"
require "user.plugins.configs.telescope"
require "user.plugins.configs.treesitter"
require "user.plugins.configs.vim-tmux-navigator"

-- plugins keymaps modules
require "user.plugins.keymaps.coc"
require "user.plugins.keymaps.floaterm"
require "user.plugins.keymaps.fzf"
require "user.plugins.keymaps.harpoon"
require "user.plugins.keymaps.markdown-preview"
require "user.plugins.keymaps.nvimdap"
require "user.plugins.keymaps.nvimtree"
require "user.plugins.keymaps.telescope"

-- LSPs, DAPs configs
require "user.plugins.configs.lsp.lsp-configs"
require('user.plugins.configs.dap.dap-languages-setup')
