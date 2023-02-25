
-- install module options: 'packer', 'vimplug'
vim.g.plugin_manager = 'packer'

-- 2 = write all buffers, 1 = write only the current buffer
vim.g.tmux_navigator_save_on_switch=2

require "user.plugins.install"

-- configs modules
require "user.plugins.configs.airline"
require "user.plugins.configs.boole"
require "user.plugins.configs.bufferline"
require "user.plugins.configs.dap"
require "user.plugins.configs.dracula"
require "user.plugins.configs.fzf"
require "user.plugins.configs.gitgutter"
require "user.plugins.configs.harpoon"
require "user.plugins.configs.hologram"
require "user.plugins.configs.mason"
require "user.plugins.configs.modicator"
require "user.plugins.configs.neotest"
require "user.plugins.configs.nvimtree"
require "user.plugins.configs.projectionist"
require "user.plugins.configs.rose_pine"
require "user.plugins.configs.short_configs"
require "user.plugins.configs.startup_nvim"
require "user.plugins.configs.telescope"
require "user.plugins.configs.treesitter"


-- LSPs, DAPs configs
require "user.plugins.configs.lsp"
require "user.plugins.configs.dap"
