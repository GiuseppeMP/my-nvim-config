vim.cmd "colorscheme tokyonight-moon"
local tokyo_colors = require("tokyonight.colors").setup()

-- tokyonight variations
-- vim.cmd.colorscheme("tokyonight")
-- vim.cmd.colorscheme("tokyonight-night")
-- vim.cmd.colorscheme("tokyonight-storm")

local colors = tokyo_colors
-- colors.magenta = tokyo_colors.magenta
colors.green = '#69ff94'
colors.purple = '#9469ff'
colors.yellow_alt = '#ff966c'
colors.moca = '#291c17'
colors.syellow = '#FFC777'
colors.bg = '#f0f0f0'
colors.none = 'none'
-- local brown = '#291c17'
colors.black = '#1a1b26'
-- local red = '#ff757f'
-- colors.red = tokyo_colors.red

-- fix xml sintax
vim.cmd [[hi! link Function Label ]]
vim.cmd [[hi! link Identifier Function ]]
vim.cmd [[hi! link xmlTagN Function ]]
vim.cmd [[hi! link @markup.raw.markdown_inline CodeBlock ]]

vim.api.nvim_set_hl(0, "CursorLine", { bg = 'none', blend = 95 })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = colors.green, bg = 'none', blend = 95 })

vim.cmd [[
    highlight Cursor guifg=none guibg=#9469ff
    highlight iCursor guifg=none guibg=#69ff94
    set guicursor=n-v-c:block-Cursor
    set guicursor+=i:hor20-iCursor
    set guicursor+=n-v-c:blinkon0
    set guicursor+=i:blinkwait10
    hi TreesitterContextBottom gui=undercurl guisp=#69ff94
    hi Comment guifg='#1f96e0'
    hi DiagnosticUnnecessary guifg='#e04b1f'

]]

-- selected winbar
vim.api.nvim_set_hl(0, 'Winbar', { fg = colors.bg, bg = 'none' })
vim.api.nvim_set_hl(0, 'WinBarNC', { fg = 'white', bg = 'none' })
vim.api.nvim_set_hl(0, 'WinBarSeparator', { fg = 'white', bg = 'none' })
vim.api.nvim_set_hl(0, 'WinSeparator', { fg = colors.purple, bold = false })
vim.api.nvim_set_hl(0, 'VertSplit', { fg = colors.purple, bold = false })
vim.api.nvim_set_hl(0, 'LspInlayHint', { fg = '#636da6', bg = 'none' })
vim.api.nvim_set_hl(0, 'FloatBorder', { fg = 'white', bg = 'none' })

vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextInfo', { bg = 'none', fg = 'yellow' })
vim.api.nvim_set_hl(0, 'TreesitterContext', { bg = 'none', fg = colors.purple })

vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', { bg = 'none', fg = colors.purple })
vim.api.nvim_set_hl(0, 'NvimTreeWinSeparator', { fg = colors.purple, bold = false })

vim.api.nvim_set_hl(0, 'Search', { fg = colors.green, bg = 'none', underline = true })
vim.api.nvim_set_hl(0, 'IncSearch', { fg = colors.purple, bg = 'none', underline = true })

vim.api.nvim_set_hl(0, 'NoiceCmdlinePopupBorderSearch', { fg = colors.purple, bg = 'none' })
vim.api.nvim_set_hl(0, 'NoiceCmdlineIconSearch', { fg = colors.green, bg = 'none' })
vim.api.nvim_set_hl(0, 'NoiceCmdlinePopupTitle', { fg = colors.green, bg = 'none' })

vim.api.nvim_set_hl(0, 'NvimTreeRootFolder', { fg = colors.purple, bg = 'none' })
vim.api.nvim_set_hl(0, 'NvimTreeFolderIcon', { fg = colors.purple, bg = 'none' })
vim.api.nvim_set_hl(0, 'NvimTreeDiagnosticErrorFileHL', { fg = colors.red, bg = 'none', undercurl = true })
vim.api.nvim_set_hl(0, 'NvimTreeDiagnosticErrorFolderHL', { fg = colors.red, bg = 'none', undercurl = true })

vim.api.nvim_set_hl(0, 'NvimTreeOpenedFolderIcon', { fg = colors.bg, bg = 'none' })
vim.api.nvim_set_hl(0, 'NvimTreeOpenedFolderName', { fg = colors.bg, bg = 'none' })
vim.api.nvim_set_hl(0, 'NvimTreeFileIcon', { fg = colors.bg, bg = 'none' })
-- vim.api.nvim_set_hl(0, 'NvimTreeDirectoryBufferline', { fg = colors.purple, bg = 'none' })
vim.api.nvim_set_hl(0, 'NvimTreeDirectoryBufferline', { bg = colors.purple, fg = colors.black })

vim.api.nvim_set_hl(0, 'BufferLineGroupSeparator', { fg = colors.purple, bg = 'none' })
vim.api.nvim_set_hl(0, 'BufferLineTabSeparator', { fg = colors.purple, bg = 'none' })
vim.api.nvim_set_hl(0, 'BufferLineSeparator', { fg = colors.purple, bg = 'none' })
vim.api.nvim_set_hl(0, 'BufferLineSeparatorVisible', { fg = colors.purple, bg = 'none' })
vim.api.nvim_set_hl(0, 'BufferLineSeparatorSelected', { fg = colors.purple, bg = 'none' })
vim.api.nvim_set_hl(0, 'BufferLineOffsetSeparator', { fg = colors.purple, bg = 'none' })
vim.api.nvim_set_hl(0, 'BufferLine', { fg = colors.purple, bg = 'none' })
vim.api.nvim_set_hl(0, 'BufferLineModifiedVisible', { fg = colors.purple, bg = 'none' })
vim.api.nvim_set_hl(0, 'BufferLineModifiedSelected', { fg = colors.purple, bg = 'none' })
vim.api.nvim_set_hl(0, 'BufferLineModified', { fg = colors.purple, bg = 'none' })
vim.api.nvim_set_hl(0, 'BufferLineIndicatorVisible', { fg = colors.purple, bg = 'none' })
vim.api.nvim_set_hl(0, 'BufferLineIndicatorSelected', { fg = colors.green, bg = 'none', sp = colors.green })
vim.api.nvim_set_hl(0, 'BufferLineTabSeparatorSelected', { fg = colors.purple, bg = 'none' })
vim.api.nvim_set_hl(0, 'BufferLineBuffer', { fg = colors.purple, bg = 'none' })
vim.api.nvim_set_hl(0, 'BufferLineTruncMarker', { fg = colors.purple, bg = 'none' })

vim.api.nvim_set_hl(0, 'BufferLineError', { fg = colors.red, bg = 'none', undercurl = true })
vim.api.nvim_set_hl(0, 'BufferLineErrorVisible', { fg = colors.red, bg = 'none', undercurl = true })
vim.api.nvim_set_hl(0, 'BufferLineErrorSelected', { fg = colors.green, bg = 'none', sp = colors.red, undercurl = true })



vim.api.nvim_set_hl(0, 'BufferLineWarning', { fg = tokyo_colors.yellow, bg = 'none', undercurl = true })
vim.api.nvim_set_hl(0, 'BufferLineWarningVisible', { fg = tokyo_colors.yellow, bg = 'none', undercurl = true })
vim.api.nvim_set_hl(0, 'BufferLineWarningSelected',
    { fg = colors.green, bg = 'none', sp = tokyo_colors.yellow, undercurl = true })
-- vim.api.nvim_set_hl(0, 'NoiceCmdlinePopupBorderCmdline', { fg = colors.purple, bg = 'none' })

-- vim.api.nvim_set_hl(0, 'Visual', { fg = colors.syellow, bg = colors.none, underline = false })
vim.api.nvim_set_hl(0, 'Visual', { fg = colors.green, bg = '#2F3D44', underline = false })
vim.api.nvim_set_hl(0, 'NoiceFormatProgressDone', { link = 'NonText' })
vim.api.nvim_set_hl(0, 'NoiceFormatProgressTodo', { link = 'NonText' })
vim.api.nvim_set_hl(0, 'NoiceLspProgressTitle', { fg = colors.green, bg = 'none', underline = false })
vim.api.nvim_set_hl(0, 'NoiceLspProgressClient', { fg = colors.magenta, bg = 'none', underline = false })

vim.api.nvim_set_hl(0, 'MiniAnimateCursor', { fg = colors.green, bg = colors.green, underline = false })

vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = colors.green, bg = 'none', underline = false })
vim.api.nvim_set_hl(0, 'GitSignsAddnr', { fg = colors.green, bg = 'none', underline = false })

vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = colors.red, bg = 'none', underline = false })
vim.api.nvim_set_hl(0, 'GitSignsDeleteNr', { fg = colors.red, bg = 'none', underline = false })

vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = colors.magenta, bg = 'none', underline = false })
vim.api.nvim_set_hl(0, 'GitSignsChangeNr', { fg = colors.magenta, bg = 'none', underline = false })

-- vim.api.nvim_set_hl(0, 'FloatShadow', { fg = '#636da6', bg = 'none' })
-- vim.api.nvim_set_hl(0, 'FloatShadowThrough', { fg = '#636da6', bg = 'none' })

-- vim.cmd [[hi NoiceVirtualText guibg=NONE ]]

vim.api.nvim_set_hl(0, 'Commments', { fg = colors.bg, bg = 'none', underline = false })
vim.api.nvim_set_hl(0, 'Commment', { fg = colors.bg, bg = 'none', underline = false })
