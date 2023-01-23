local n = require('user.keymaps._utils').n

-- breakpoint
n('<Leader>tb', ":lua require('dap').toggle_breakpoint()<CR>")
-- debug continue
n('<Leader>dc', ":lua require('dap').continue()<CR>")
-- debug step over
n('<Leader>dd', ":lua require('dap').step_over()<CR>")
-- debug step into
n('<Leader>si', ":lua require('dap').step_into()<CR>")
-- debug step out
n('<Leader>so', ":lua require('dap').step_out()<CR>")
-- repl
n('<Leader>dr', ":lua require('dap').repl.open()<CR>")
-- run last
n('<Leader>dl', ":lua require('dap').run_last()<CR>")
