require("user.plugins.configs.dracula")
-- local g = vim.g

-- vim.cmd[[colorscheme happy_hacking]]

-- set colorscheme after options
vim.cmd('colorscheme rose-pine')
-- vim.cmd[[colorscheme dracula]]
-- vim.cmd[[colorscheme synthwave84]]

-- vim.cmd[[colorscheme onedark]]
-- g.onedark_terminal_italics = 1
-- g.onedark_termcolors = 256
--

-- fix xml sintax
vim.cmd [[hi! link Function Label ]]
vim.cmd [[hi! link Identifier Function ]]
vim.cmd [[hi! link xmlTagN Function ]]
