-- Utils for normal mode keybmaps
-- Utilitario para binds em normal mode
local n = require "user.keymaps._utils".n

-- Primeagen/harpoon keybinds
-- Exibe a lista de arquivos marcados
-- Show marked files list
n("mm", ":lua require('harpoon.ui').toggle_quick_menu()<CR>")

-- Add the current buffer to marked list
-- Marca o buffer atual
n("ma", ":lua require('harpoon.mark').add_file()<CR>")

-- Navigates to the marked buffer {x}
-- Navega para o buffer marcado {x}
n("<leader>1", ":lua require('harpoon.ui').nav_file(1)<CR>")
n("<leader>2", ":lua require('harpoon.ui').nav_file(2)<CR>")
n("<leader>3", ":lua require('harpoon.ui').nav_file(3)<CR>")
n("<leader>4", ":lua require('harpoon.ui').nav_file(4)<CR>")
n("<leader>5", ":lua require('harpoon.ui').nav_file(5)<CR>")
n("<leader>6", ":lua require('harpoon.ui').nav_file(6)<CR>")
n("<leader>7", ":lua require('harpoon.ui').nav_file(7)<CR>")
n("<leader>8", ":lua require('harpoon.ui').nav_file(8)<CR>")
n("<leader>9", ":lua require('harpoon.ui').nav_file(9)<CR>")

-- Navigates to the terminal {x}
-- Navega para o terminal {x}
-- IMPORTANT: If you are not using tmux, change the command to 'harpoon.term'
-- IMPORTANT: Se você não utiliza Tmux, altere o comando para 'harpoon.term'
-- e.g: ":lua require('harpoon.term').gotoTerminal(1)<CR>"
n("<Leader>ht1", ":lua require('harpoon.tmux').gotoTerminal(1)<CR>")
n("<Leader>ht2", ":lua require('harpoon.tmux').gotoTerminal(2)<CR>")
n("<Leader>ht3", ":lua require('harpoon.tmux').gotoTerminal(3)<CR>")
n("<Leader>ht4", ":lua require('harpoon.tmux').gotoTerminal(4)<CR>")
n("<C-t><C-t>", ":lua require('harpoon.tmux').gotoTerminal(0)<CR>")
