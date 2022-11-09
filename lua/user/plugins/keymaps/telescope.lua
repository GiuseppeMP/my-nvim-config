local builtin = require('telescope.builtin')
local n = require 'user.keymaps._utils'.n

n( '<leader>ff', builtin.find_files)
n( '<leader>fg', builtin.live_grep)
n( '<leader>fgc', builtin.git_commits)
n( '<leader>fgb', builtin.git_branches)
n( '<leader>fb', builtin.buffers )
n( '<leader>fh', builtin.help_tags )
n( '<leader>fk', builtin.keymaps )
n( '<leader>fm', ':Telescope harpoon marks <CR>' )
