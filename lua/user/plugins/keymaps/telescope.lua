local builtin = require('telescope.builtin')
local n = require 'user.keymaps._utils'.n

n( '<leader>ff', builtin.find_files)
n( '<leader>fg', builtin.live_grep)
n( '<leader>fb', builtin.buffers )
n( '<leader>fh', builtin.help_tags )
n( '<leader>fm', ':Telescope harpoon marks <CR>' )
