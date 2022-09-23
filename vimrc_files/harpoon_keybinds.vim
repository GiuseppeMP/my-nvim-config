
 " Primeagen/harpoon keybinds 
nnoremap <silent> mm <Cmd>:lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <silent> ma <Cmd>:lua require("harpoon.mark").add_file()<CR>
nnoremap <silent> <Leader>ht1 <Cmd>:lua require("harpoon.term").gotoTerminal(1)<CR>
nnoremap <silent> <Leader>ht2 <Cmd>:lua require("harpoon.term").gotoTerminal(2)<CR>
nnoremap <silent> <Leader>ht3 <Cmd>:lua require("harpoon.term").gotoTerminal(3)<CR>
nnoremap <silent> <Leader>ht4 <Cmd>:lua require("harpoon.term").gotoTerminal(4)<CR>
nnoremap <silent> 1 <Cmd>:lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <silent> 2 <Cmd>:lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <silent> 3 <Cmd>:lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <silent> 4 <Cmd>:lua require("harpoon.ui").nav_file(4)<CR>


nnoremap <C-t> <Cmd>:lua require("harpoon.term").gotoTerminal(0)<CR>
