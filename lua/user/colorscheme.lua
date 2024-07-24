---@diagnostic disable: inject-field
vim.cmd "colorscheme tokyonight-moon"
local colors = require("user.colors").colors

-- fix xml sintax
vim.cmd [[hi! link Function Label ]]
vim.cmd [[hi! link Identifier Function ]]
vim.cmd [[hi! link xmlTagN Function ]]
vim.cmd [[hi! link @markup.raw.markdown_inline CodeBlock ]]

vim.api.nvim_set_hl(0, "CursorLine", { bg = '#24283b', fg = 'none' })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = colors.b_yellow, bg = 'none', blend = 0, force = true })

vim.cmd [[
    "highlight Cursor guifg=none guibg=#9469ff
    highlight Cursor guifg=none guibg=#98f3a1
    highlight CursorBlock guifg=#98f3a1 guibg=#98f3a1
    highlight iCursor guifg=none guibg=#69ff94
    set guicursor=n-v-c:block-CursorBlock
    set guicursor+=i:hor20-iCursor
    set guicursor+=n-v-c:blinkon0
    set guicursor+=i:blinkwait10
    hi TreesitterContextBottom gui=underdashed guisp=#69ff94
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

vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextInfo', { bg = 'none', fg = colors.b_yellow })
vim.api.nvim_set_hl(0, 'TreesitterContext', { bg = 'none', fg = colors.purple })

vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', { bg = 'none', fg = colors.b_yellow })
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

vim.api.nvim_set_hl(0, 'NvimTreeOpenedFolderIcon', { fg = colors.green, bg = 'none' })
vim.api.nvim_set_hl(0, 'NvimTreeOpenedFolderName', { fg = colors.green, bg = 'none' })
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

vim.api.nvim_set_hl(0, 'BufferLineWarning', { fg = colors.yellow, bg = 'none', undercurl = true })
vim.api.nvim_set_hl(0, 'BufferLineWarningVisible', { fg = colors.yellow, bg = 'none', undercurl = true })
vim.api.nvim_set_hl(0, 'BufferLineWarningSelected',
    { fg = colors.green, bg = 'none', sp = colors.yellow, undercurl = true })
-- vim.api.nvim_set_hl(0, 'NoiceCmdlinePopupBorderCmdline', { fg = colors.purple, bg = 'none' })

-- vim.api.nvim_set_hl(0, 'Visual', { fg = colors.syellow, bg = colors.none, underline = false })
vim.api.nvim_set_hl(0, 'Visual', { fg = colors.green, bg = '#2F3D44', underline = false })
vim.api.nvim_set_hl(0, 'NoiceFormatProgressDone', { link = 'NonText' })
vim.api.nvim_set_hl(0, 'NoiceFormatProgressTodo', { link = 'NonText' })
vim.api.nvim_set_hl(0, 'FidgetLspProgress', { link = 'NonText' })
vim.api.nvim_set_hl(0, 'NoiceLspProgressTitle', { fg = colors.green, bg = 'none', underline = false })
vim.api.nvim_set_hl(0, 'NoiceLspProgressClient', { fg = colors.magenta, bg = 'none', underline = false })

vim.api.nvim_set_hl(0, 'MiniAnimateCursor', { fg = colors.green, bg = colors.green, underline = false })

vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = colors.green, bg = 'none', underline = false })
vim.api.nvim_set_hl(0, 'GitSignsAddnr', { fg = colors.b_yellow, bg = 'none', underline = false })

vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = colors.red, bg = 'none', underline = false })
vim.api.nvim_set_hl(0, 'GitSignsDeleteNr', { fg = colors.b_yellow, bg = 'none', underline = false })

vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = colors.magenta, bg = 'none', underline = false })
vim.api.nvim_set_hl(0, 'GitSignsChangeNr', { fg = colors.b_yellow, bg = 'none', underline = false })

vim.api.nvim_set_hl(0, 'Commments', { fg = colors.bg, bg = 'none', underline = false })
vim.api.nvim_set_hl(0, 'Commment', { fg = colors.bg, bg = 'none', underline = false })
