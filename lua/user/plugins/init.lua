-- install module options: 'packer', 'vimplug', 'lazy'
vim.g.plugin_manager = 'lazy'

-- 2 = write all buffers, 1 = write only the current buffer
vim.g.tmux_navigator_save_on_switch = 2

require "user.plugins.install"

-- configs modules
require "user.plugins.configs.boole"
require "user.plugins.configs.bufferline"
require "user.plugins.configs.cmp"
require "user.plugins.configs.dap"
require "user.plugins.configs.dracula"
require "user.plugins.configs.dressing"
require "user.plugins.configs.fidget"
require "user.plugins.configs.gitsigns"
require "user.plugins.configs.harpoon"
require "user.plugins.configs.mason"
require "user.plugins.configs.neotest"
require "user.plugins.configs.nvimtree"
require "user.plugins.configs.nvterm"
require "user.plugins.configs.projectionist"
require "user.plugins.configs.rose_pine"
require "user.plugins.configs.startup_nvim"
require "user.plugins.configs.telescope"
require "user.plugins.configs.treesitter"
require "user.plugins.configs.vim_test"
require "user.plugins.configs.which_key"


-- LSPs, DAPs configs
require "user.plugins.configs.lsp"
require "user.plugins.configs.dap"
