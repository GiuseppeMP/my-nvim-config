local builtin = require('telescope.builtin')

local k = require "user.keymaps._utils"
local n = k.n
local v = k.v
local i = k.i
local i_expr_nrk = k.i_expr_nrk
local i_expr = k.i_expr

-- no-mods session - fastest keystrokes
n( "ma", ":lua require('harpoon.mark').add_file()<CR>")
n( "mm", ":lua require('harpoon.ui').toggle_quick_menu()<CR>")

-- ctrl session
n( "<c-f>", ":NvimTreeFindFile<CR>")
n( '<c-f><c-f>',':FloatermToggle<CR>')
n( "<c-m><c-m>", "<Plug>MarkdownPreview")
n( "<c-t><c-t>", ":lua require('harpoon.tmux').gotoTerminal(0)<CR>")

-- leader session
n( "<leader>1", ":lua require('harpoon.ui').nav_file(1)<CR>")
n( "<leader>2", ":lua require('harpoon.ui').nav_file(2)<CR>")
n( "<leader>3", ":lua require('harpoon.ui').nav_file(3)<CR>")
n( "<leader>4", ":lua require('harpoon.ui').nav_file(4)<CR>")
n( "<leader>5", ":lua require('harpoon.ui').nav_file(5)<CR>")
n( "<leader>6", ":lua require('harpoon.ui').nav_file(6)<CR>")
n( "<leader>7", ":lua require('harpoon.ui').nav_file(7)<CR>")
n( "<leader>8", ":lua require('harpoon.ui').nav_file(8)<CR>")
n( "<leader>9", ":lua require('harpoon.ui').nav_file(9)<CR>")

n( '<leader>dc', ":lua require('dap').continue()<CR>")
n( '<leader>dd', ":lua require('dap').step_over()<CR>")
n( '<leader>dl', ":lua require('dap').run_last()<CR>")
n( '<leader>dr', ":lua require('dap').repl.open()<CR>")

n( '<leader>e', ':NvimTreeToggle<CR>')

n( '<leader>ff', builtin.find_files)
n( '<leader>fg', builtin.live_grep)
n( '<leader>fgc', builtin.git_commits)
n( '<leader>fgb', builtin.git_branches)
n( '<leader>fb', builtin.buffers )
n( '<leader>fh', builtin.help_tags )
n( '<leader>fk', builtin.keymaps )
n( '<leader>fm', ':Telescope harpoon marks <CR>' )

n( 'ga', function() k.write_buffer() vim.cmd(":A") end)

n( "<leader>ht1", ":lua require('harpoon.tmux').gotoTerminal(1)<CR>")
n( "<leader>ht2", ":lua require('harpoon.tmux').gotoTerminal(2)<CR>")
n( "<leader>ht3", ":lua require('harpoon.tmux').gotoTerminal(3)<CR>")
n( "<leader>ht4", ":lua require('harpoon.tmux').gotoTerminal(4)<CR>")

n( '<leader>si', ":lua require('dap').step_into()<CR>")
n( '<leader>so', ":lua require('dap').step_out()<CR>")

n( '<leader>tb', ":lua require('dap').toggle_breakpoint()<CR>") -- toggle breakpoint
n( '<leader>td', ":lua require'neotest'.run.run({ strategy = 'dap' })<CR>") -- debug nearest
n( '<leader>t' , function() k.write_buffer() vim.cmd(":lua require'neotest'.run.run()") end) -- test nearest
n( '<leader>tf', ":lua require'neotest'.run.run(vim.fn.expand('%'))<CR>") -- test file

-- i("c-j>", "<Plug>(coc-snippets-expand-jump)")
i_expr("<c-space>", "coc#refresh()")
i_expr_nrk("<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]])
