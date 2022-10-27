-- plugins description pls see "plugins._list.lua"

-- install module
require "user.plugins.install.with-vimplug"

-- configs modules
require "user.plugins.configs.treesitter"
require "user.plugins.configs.short_configs"
require "user.plugins.configs.nerdtree"
require "user.plugins.configs.harpoon"
require "user.plugins.configs.coc"
require "user.plugins.configs.neotest"
require "user.plugins.configs.bufferline"
require "user.plugins.configs.vimspector"
require "user.plugins.configs.telescope"

-- plugins keymaps modules
require "user.plugins.keymaps.harpoon"
require "user.plugins.keymaps.coc"
require "user.plugins.keymaps.vimspector"
require "user.plugins.keymaps.telescope"
