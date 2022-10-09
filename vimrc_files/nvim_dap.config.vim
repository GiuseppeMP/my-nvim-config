" nvim-dap is a Debug Adapter Protocol client implementation for Neovim. nvim-dap allows you to:

"     Launch an application to debug
"     Attach to running applications and debug them
"     Set breakpoints and step through code
"     Inspect the state of the application


nnoremap <silent><Leader>tb <Cmd>lua require('dap').toggle_breakpoint()<CR>
