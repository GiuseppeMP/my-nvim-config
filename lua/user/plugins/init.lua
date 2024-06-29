-- install module options: 'packer', 'vimplug', 'lazy'
vim.g.plugin_manager = 'lazy'

-- 2 = write all buffers, 1 = write only the current buffer
vim.g.tmux_navigator_save_on_switch = 2

require "user.plugins.install"


local configs = {
    -- ui
    -- { conf = function() require "user.plugins.configs.alpha" end,         name = 'alpha' },
    -- configs modules
    -- { conf = function() require "user.plugins.configs.boole" end,         name = 'boole' },
    -- { conf = function() require "user.plugins.configs.bufferline" end,    name = 'bufferline' },
    -- { conf = function() require "user.plugins.configs.cmp" end,           name = 'cmp' },
    { conf = function() require "user.plugins.configs.dap" end,      name = 'dap' },
    -- { conf = function() require "user.plugins.configs.dressing" end,      name = 'dressing' },
    -- { conf = function() require "user.plugins.configs.gitsigns" end,      name = 'gitsigns' },
    -- { conf = function() require "user.plugins.configs.harpoon" end,       name = 'harpoon' },
    -- { conf = function() require "user.plugins.configs.hop" end,           name = 'hop' },
    -- { conf = function() require "user.plugins.configs.mason" end,         name = 'mason' },
    -- { conf = function() require "user.plugins.configs.navic" end,         name = 'navic' },
    -- { conf = function() require "user.plugins.configs.neotest" end,       name = 'neotest' },
    -- { conf = function() require "user.plugins.configs.noice" end,         name = 'noice' },
    -- { conf = function() require "user.plugins.configs.null_ls" end,       name = 'null_ls' },
    -- { conf = function() require "user.plugins.configs.nvimtree" end,      name = 'nvimtree' },
    -- { conf = function() require "user.plugins.configs.obsidian" end,      name = 'obsidian' },
    -- { conf = function() require "user.plugins.configs.startup_nvim" end,  name = 'startup_nvim' },
    { conf = function() require "user.plugins.configs.overseer" end, name = 'overseer' },
    -- { conf = function() require "user.plugins.configs.telescope" end,     name = 'telescope' },
    -- { conf = function() require "user.plugins.configs.treesitter" end, name = 'treesitter' },
    -- { conf = function() require "user.plugins.configs.vim_test" end, name = 'vim_test' },
    -- { conf = function() require "user.plugins.configs.which_key" end,  name = 'which_key' },
    -- { conf = function() require "user.plugins.configs.projectionist" end, name = 'projectionist' },
}

-- err handling setup configs
for _, conf in pairs(configs) do
    utils.init_err_handler(conf.name, conf.conf)
end

-- LSPs, DAPs configs
require "user.plugins.configs.lsp"
