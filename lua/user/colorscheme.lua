-- tokyonight variations
-- vim.cmd.colorscheme("tokyonight")
-- vim.cmd.colorscheme("tokyonight-night")
-- vim.cmd.colorscheme("tokyonight-storm")
vim.cmd.colorscheme("tokyonight-moon")

-- fix xml sintax
vim.cmd [[hi! link Function Label ]]
vim.cmd [[hi! link Identifier Function ]]
vim.cmd [[hi! link xmlTagN Function ]]


-- vim.cmd [[hi NvimTreeNormal guifg=NONE guibg=NONE ctermbg=NONE]]

vim.api.nvim_set_hl(0, "CursorLine", { bg = 'none', blend = 95 })

local green = '#69ff94'

-- selected winbar
vim.api.nvim_set_hl(0, 'Winbar', { fg = green, bg = 'none' })
vim.api.nvim_set_hl(0, 'WinBarNC', { fg = 'white', bg = 'none' })
vim.api.nvim_set_hl(0, 'WinBarSeparator', { fg = 'white', bg = 'none' })
vim.api.nvim_set_hl(0, 'LspInlayHint', { fg = '#636da6', bg = 'none' })
vim.api.nvim_set_hl(0, 'FloatBorder', { fg = 'white', bg = 'none' })

vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextInfo', { bg = 'none', fg = 'yellow' })
vim.api.nvim_set_hl(0, 'TreesitterContext', { bg = 'none', fg = 'yellow' })

-- vim.api.nvim_set_hl(0, 'FloatShadow', { fg = '#636da6', bg = 'none' })
-- vim.api.nvim_set_hl(0, 'FloatShadowThrough', { fg = '#636da6', bg = 'none' })

-- vim.cmd [[hi NoiceVirtualText guibg=NONE ]]
