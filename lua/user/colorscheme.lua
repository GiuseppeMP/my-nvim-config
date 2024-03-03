-- tokyonight variations
-- vim.cmd.colorscheme("tokyonight")
-- vim.cmd.colorscheme("tokyonight-night")
-- vim.cmd.colorscheme("tokyonight-storm")
vim.cmd.colorscheme("tokyonight-moon")
local tokyo_colors = require("tokyonight.colors").setup()

local green = '#69ff94'
local purple = '#9469ff'
local syellow = '#ff966c'
local bg = '#f0f0f0'
local brown = '#291c17'
-- local red = '#ff757f'
local red = tokyo_colors.red

-- fix xml sintax
vim.cmd [[hi! link Function Label ]]
vim.cmd [[hi! link Identifier Function ]]
vim.cmd [[hi! link xmlTagN Function ]]

vim.api.nvim_set_hl(0, "CursorLine", { bg = 'none', blend = 95 })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = green, bg = 'none', blend = 95 })

vim.cmd [[
    highlight Cursor guifg=none guibg=#9469ff
    highlight iCursor guifg=none guibg=#69ff94
    set guicursor=n-v-c:block-Cursor
    set guicursor+=i:hor20-iCursor
    set guicursor+=n-v-c:blinkon0
    set guicursor+=i:blinkwait10
    hi TreesitterContextBottom gui=undercurl guisp=#69ff94
]]

-- selected winbar
vim.api.nvim_set_hl(0, 'Winbar', { fg = bg, bg = 'none' })
vim.api.nvim_set_hl(0, 'WinBarNC', { fg = 'white', bg = 'none' })
vim.api.nvim_set_hl(0, 'WinBarSeparator', { fg = 'white', bg = 'none' })
vim.api.nvim_set_hl(0, 'WinSeparator', { fg = purple, bold = false })
vim.api.nvim_set_hl(0, 'VertSplit', { fg = purple, bold = false })
vim.api.nvim_set_hl(0, 'LspInlayHint', { fg = '#636da6', bg = 'none' })
vim.api.nvim_set_hl(0, 'FloatBorder', { fg = 'white', bg = 'none' })

vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextInfo', { bg = 'none', fg = 'yellow' })
vim.api.nvim_set_hl(0, 'TreesitterContext', { bg = 'none', fg = purple })

vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', { bg = 'none', fg = purple })
vim.api.nvim_set_hl(0, 'NvimTreeWinSeparator', { fg = purple, bold = false })

vim.api.nvim_set_hl(0, 'Search', { fg = green, bg = 'none', underline = true })
vim.api.nvim_set_hl(0, 'IncSearch', { fg = purple, bg = 'none', underline = true })

vim.api.nvim_set_hl(0, 'NoiceCmdlinePopupBorderSearch', { fg = purple, bg = 'none' })
vim.api.nvim_set_hl(0, 'NoiceCmdlineIconSearch', { fg = green, bg = 'none' })
vim.api.nvim_set_hl(0, 'NoiceCmdlinePopupTitle', { fg = green, bg = 'none' })

vim.api.nvim_set_hl(0, 'NvimTreeRootFolder', { fg = purple, bg = 'none' })
vim.api.nvim_set_hl(0, 'NvimTreeFolderIcon', { fg = purple, bg = 'none' })
vim.api.nvim_set_hl(0, 'NvimTreeDiagnosticErrorFileHL', { fg = red, bg = 'none', undercurl = true })
vim.api.nvim_set_hl(0, 'NvimTreeDiagnosticErrorFolderHL', { fg = red, bg = 'none', undercurl = true })

vim.api.nvim_set_hl(0, 'NvimTreeOpenedFolderIcon', { fg = bg, bg = 'none' })
vim.api.nvim_set_hl(0, 'NvimTreeOpenedFolderName', { fg = bg, bg = 'none' })
vim.api.nvim_set_hl(0, 'NvimTreeFileIcon', { fg = bg, bg = 'none' })
vim.api.nvim_set_hl(0, 'NvimTreeDirectoryBufferline', { fg = purple, bg = 'none' })

vim.api.nvim_set_hl(0, 'BufferLineGroupSeparator', { fg = purple, bg = 'none' })
vim.api.nvim_set_hl(0, 'BufferLineTabSeparator', { fg = purple, bg = 'none' })
vim.api.nvim_set_hl(0, 'BufferLineSeparator', { fg = purple, bg = 'none' })
vim.api.nvim_set_hl(0, 'BufferLineSeparatorVisible', { fg = purple, bg = 'none' })
vim.api.nvim_set_hl(0, 'BufferLineSeparatorSelected', { fg = purple, bg = 'none' })
vim.api.nvim_set_hl(0, 'BufferLineOffsetSeparator', { fg = purple, bg = 'none' })
vim.api.nvim_set_hl(0, 'BufferLine', { fg = purple, bg = 'none' })
vim.api.nvim_set_hl(0, 'BufferLineModifiedVisible', { fg = purple, bg = 'none' })
vim.api.nvim_set_hl(0, 'BufferLineIndicatorVisible', { fg = purple, bg = 'none' })
vim.api.nvim_set_hl(0, 'BufferLineIndicatorSelected', { fg = green, bg = 'none', sp = green })
vim.api.nvim_set_hl(0, 'BufferLineTabSeparatorSelected', { fg = purple, bg = 'none' })
vim.api.nvim_set_hl(0, 'BufferLineBuffer', { fg = purple, bg = 'none' })
vim.api.nvim_set_hl(0, 'BufferLineTruncMarker', { fg = purple, bg = 'none' })

vim.api.nvim_set_hl(0, 'BufferLineError', { fg = red, bg = 'none', undercurl = true })
vim.api.nvim_set_hl(0, 'BufferLineErrorVisible', { fg = red, bg = 'none', undercurl = true })
vim.api.nvim_set_hl(0, 'BufferLineErrorSelected', { fg = green, bg = 'none', sp = red, undercurl = true })



vim.api.nvim_set_hl(0, 'BufferLineWarning', { fg = tokyo_colors.yellow, bg = 'none', undercurl = true })
vim.api.nvim_set_hl(0, 'BufferLineWarningVisible', { fg = tokyo_colors.yellow, bg = 'none', undercurl = true })
vim.api.nvim_set_hl(0, 'BufferLineWarningSelected',
    { fg = green, bg = 'none', sp = tokyo_colors.yellow, undercurl = true })
-- vim.api.nvim_set_hl(0, 'NoiceCmdlinePopupBorderCmdline', { fg = purple, bg = 'none' })


-- vim.api.nvim_set_hl(0, 'FloatShadow', { fg = '#636da6', bg = 'none' })
-- vim.api.nvim_set_hl(0, 'FloatShadowThrough', { fg = '#636da6', bg = 'none' })

-- vim.cmd [[hi NoiceVirtualText guibg=NONE ]]
