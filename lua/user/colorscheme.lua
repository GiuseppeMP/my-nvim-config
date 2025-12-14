user_colors = require("user.colors")
local colors = user_colors.colors
local util = user_colors.util

-- vim.cmd.colorscheme "tokyonight-moon"
vim.cmd.colorscheme "catppuccin-mocha"

-- fix xml sintax
vim.cmd [[hi! link Function Label ]]
vim.cmd [[hi! link Identifier Function ]]
vim.cmd [[hi! link xmlTagN Function ]]
vim.cmd [[hi! link @markup.raw.markdown_inline CodeBlock ]]

-- vim.api.nvim_set_hl(0, "CursorLine", { bg = 'none', fg = 'none', blend = 90 })
vim.api.nvim_set_hl(0, "CursorLine", { bg = 'none', fg = 'none' })
-- vim.api.nvim_set_hl(0, "CursorLineNr", { fg = colors.b_yellow, bg = 'none', blend = 0, force = true })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = colors.green, bg = 'none', blend = 0, force = true })
vim.api.nvim_set_hl(0, "Cursor", { fg = colors.red, bg = colors.green, blend = 0, force = true })
vim.api.nvim_set_hl(0, "CursorBlock", { fg = colors.green, bg = 'none', blend = 0, force = true })
vim.api.nvim_set_hl(0, "lCursor", { fg = colors.green, bg = colors.green, blend = 0, force = true })
vim.api.nvim_set_hl(0, "iCursor", { fg = 'none', bg = colors.green, blend = 0, force = true })
vim.api.nvim_set_hl(0, "TreesitterContextBottom", { underdashed = false, sp = colors.green, force = true })
vim.api.nvim_set_hl(0, "Comment", { fg = util.darken(colors.blue, 0.7), italic = true })
vim.api.nvim_set_hl(0, "DiagnosticUnnecessary", { fg = util.darken(colors.blue, 0.7) })

vim.cmd [[
    "set guicursor=n-v-c:blinkon20-CursorBlock
    "set guicursor+=i:hor20-iCursor
    "set guicursor+=n:ver20-iCursor
    "set guicursor+=n-v-c:blinkon0
    "set guicursor+=i:blinkon0
    set guicursor=n-v-c:block,i-ci-ve:hor50,r-cr:hor20,o:hor50
    \,a:blinkwait250-blinkoff250-blinkon250-Cursor/iCursor
    \,sm:block-blinkwait175-blinkoff150-blinkon175

]]

-- selected winbar
vim.api.nvim_set_hl(0, 'Winbar', { fg = colors.bg, bg = 'none' })
vim.api.nvim_set_hl(0, 'WinBarNC', { fg = 'white', bg = 'none' })
vim.api.nvim_set_hl(0, 'WinBarSeparator', { fg = 'white', bg = 'none' })
vim.api.nvim_set_hl(0, 'WinSeparator', { fg = colors.purple, bold = false })
vim.api.nvim_set_hl(0, 'VertSplit', { fg = colors.purple, bold = false })
vim.api.nvim_set_hl(0, 'LspInlayHint', { fg = colors.gray, bg = 'none' })
vim.api.nvim_set_hl(0, 'FloatBorder', { fg = 'white', bg = 'none' })

vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextInfo', {
    bg = 'none',
    fg = colors.yellow,
})
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineInfo', {
    bg = 'none',
    fg = colors.blue,
    undercurl = false,
    underline = true,
})
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', {
    bg = 'none',
    fg = colors.red,
    undercurl = false,
    underline = true,
})
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarn', {
    bg = 'none',
    fg = colors.yellow,
    undercurl = false,
    underline = true,
})
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineHint', {
    bg = 'none',
    fg = colors.blue,
    undercurl = false,
    underline = true,
})

vim.api.nvim_set_hl(0, 'TreesitterContext', { bg = 'none', fg = colors.purple })

-- vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', { bg = 'none', fg = colors.yellow })
vim.api.nvim_set_hl(0, 'NvimTreeWinSeparator', { fg = colors.purple, bold = false })
vim.api.nvim_set_hl(0, 'NvimTreeWindowPicker', { bg = colors.purple, fg = colors.black, bold = true })

vim.api.nvim_set_hl(0, 'Search', { fg = colors.green, bg = 'none', underline = true })
vim.api.nvim_set_hl(0, 'IncSearch', { fg = colors.purple, bg = 'none', underline = true })

vim.api.nvim_set_hl(0, 'NoiceCmdlinePopupBorderSearch', { fg = colors.purple, bg = 'none' })
vim.api.nvim_set_hl(0, 'NoiceCmdlineIconSearch', { fg = colors.green, bg = 'none' })
vim.api.nvim_set_hl(0, 'NoiceCmdlinePopupTitle', { fg = colors.green, bg = 'none' })

vim.api.nvim_set_hl(0, 'NvimTreeRootFolder', { fg = colors.purple, bg = 'none' })
vim.api.nvim_set_hl(0, 'NvimTreeFolderIcon', { fg = colors.purple, bg = 'none' })
vim.api.nvim_set_hl(0, 'NvimTreeDiagnosticErrorFileHL', { fg = colors.red, bg = 'none', undercurl = true })
vim.api.nvim_set_hl(0, 'NvimTreeDiagnosticErrorFolderHL', { fg = colors.red, bg = 'none', undercurl = true })

-- vim.api.nvim_set_hl(0, 'NvimTreeOpenedFolderIcon', { fg = colors.green, bg = 'none' })
-- vim.api.nvim_set_hl(0, 'NvimTreeOpenedFolderName', { fg = colors.green, bg = 'none' })
vim.api.nvim_set_hl(0, 'NvimTreeOpenedFolderIcon', { fg = colors.green, bg = 'none' })
vim.api.nvim_set_hl(0, 'NvimTreeOpenedFolderName', { fg = colors.green, bg = 'none', bold = true })
vim.api.nvim_set_hl(0, 'NvimTreeOpenedFile', { fg = colors.green, bg = 'none' })
vim.api.nvim_set_hl(0, 'NvimTreeFileIcon', { fg = colors.bg, bg = 'none' })
vim.api.nvim_set_hl(0, 'NvimTreeDirectoryBufferline',
    { bg = colors.none, fg = colors.green, underdashed = false, bold = true })
vim.api.nvim_set_hl(0, 'BufferLineGroupSeparator', { fg = colors.purple, bg = 'none', nocombine = true })
vim.api.nvim_set_hl(0, 'BufferLineTabSeparator', { fg = colors.purple, bg = 'none', nocombine = true })
vim.api.nvim_set_hl(0, 'BufferLineSeparator', { fg = colors.purple, bg = 'none', nocombine = true })
vim.api.nvim_set_hl(0, 'BufferLineSeparatorVisible', { fg = colors.purple, bg = 'none', nocombine = true })
vim.api.nvim_set_hl(0, 'BufferLineSeparatorSelected', { fg = colors.purple, bg = 'none', nocombine = true })
vim.api.nvim_set_hl(0, 'BufferLineOffsetSeparator', { fg = colors.purple, bg = 'none', nocombine = true })
vim.api.nvim_set_hl(0, 'BufferLine', { fg = colors.purple, bg = 'none', nocombine = true })
vim.api.nvim_set_hl(0, 'BufferLineModifiedVisible', { fg = colors.purple, bg = 'none', nocombine = true })
vim.api.nvim_set_hl(0, 'BufferLineModifiedSelected', { fg = colors.purple, bg = 'none', nocombine = true })
vim.api.nvim_set_hl(0, 'BufferLineModified', { fg = colors.purple, bg = 'none', nocombine = true })
vim.api.nvim_set_hl(0, 'BufferLineIndicatorVisible', { fg = colors.purple, bg = 'none', nocombine = true })
vim.api.nvim_set_hl(0, 'BufferLineIndicatorSelected',
    { fg = colors.green, bg = 'none', sp = colors.green, nocombine = true })
vim.api.nvim_set_hl(0, 'BufferLineTabSeparatorSelected', { fg = colors.purple, bg = 'none', nocombine = true })
vim.api.nvim_set_hl(0, 'BufferLineBuffer', { fg = colors.purple, bg = 'none', nocombine = true })
vim.api.nvim_set_hl(0, 'BufferLineTruncMarker', { fg = colors.purple, bg = 'none', nocombine = true })
vim.api.nvim_set_hl(0, 'BufferlineFill', { bg = 'none', ctermbg = 'none', nocombine = true, force = true })

vim.api.nvim_set_hl(0, 'BufferLineError', { fg = colors.red, bg = 'none', underdashed = false })
vim.api.nvim_set_hl(0, 'BufferLineErrorVisible', { fg = colors.red, bg = 'none', underdashed = false })
vim.api.nvim_set_hl(0, 'BufferLineErrorSelected',
    { fg = colors.red, bg = 'none', sp = colors.red, underdashed = false, bold = true })

vim.api.nvim_set_hl(0, 'BufferLineWarning', { fg = colors.yellow, bg = 'none', underdashed = true })
vim.api.nvim_set_hl(0, 'BufferLineWarningVisible', { fg = colors.yellow, bg = 'none', undercurl = false })
vim.api.nvim_set_hl(0, 'BufferLineWarningSelected',
    { fg = colors.green, bg = 'none', sp = colors.yellow, undercurl = false })

-- vim.api.nvim_set_hl(0, 'Visual', { bg = colors., fg = colors.yellow, underline = false })
vim.api.nvim_set_hl(0, 'NoiceFormatProgressDone', { link = 'NonText' })
vim.api.nvim_set_hl(0, 'NoiceFormatProgressTodo', { link = 'NonText' })
vim.api.nvim_set_hl(0, 'FidgetLspProgress', { link = 'NonText' })
vim.api.nvim_set_hl(0, 'NoiceLspProgressTitle', { fg = colors.b_green, bg = 'none', underline = false })
vim.api.nvim_set_hl(0, 'NoiceLspProgressClient', { fg = colors.magenta, bg = 'none', underline = false })

vim.api.nvim_set_hl(0, 'MiniAnimateCursor', { fg = colors.b_green, bg = colors.green, underline = false })

vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = colors.b_green, bg = 'none', underline = false })
vim.api.nvim_set_hl(0, 'GitSignsAddnr', { fg = colors.b_yellow, bg = 'none', underline = false })

vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = colors.red, bg = 'none', underline = false })
vim.api.nvim_set_hl(0, 'GitSignsDeleteNr', { fg = colors.b_yellow, bg = 'none', underline = false })

vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = colors.magenta, bg = 'none', underline = false })
vim.api.nvim_set_hl(0, 'GitSignsChangeNr', { fg = colors.b_yellow, bg = 'none', underline = false })

vim.api.nvim_set_hl(0, 'Commments', { fg = colors.bg, bg = 'none', underline = false })
vim.api.nvim_set_hl(0, 'Commment', { fg = colors.bg, bg = 'none', underline = false })


-- DAP


vim.api.nvim_set_hl(0, 'DapUIStop', { fg = colors.red, bg = 'none', underline = false, bold = true })
vim.api.nvim_set_hl(0, 'DapUIScope', { fg = colors.green, bg = 'none', underline = false, bold = true })
vim.api.nvim_set_hl(0, 'DapUIThread', { fg = colors.green, bg = 'none', underline = false, bold = true })
vim.api.nvim_set_hl(0, 'DapUIRestart', { fg = colors.green, bg = 'none', underline = false, bold = true })
vim.api.nvim_set_hl(0, 'DapUIPlayPause', { fg = colors.green, bg = 'none', underline = false, bold = true })

vim.api.nvim_set_hl(0, 'DapUIBreakpointsLine', { fg = colors.blue, bg = 'none', underline = false, bold = true })
vim.api.nvim_set_hl(0, 'DapUIBreakpointsPath', { fg = colors.blue, bg = 'none', underline = false, bold = true })
vim.api.nvim_set_hl(0, 'DapUILineNumber', { fg = colors.blue, bg = 'none', underline = false, bold = true })
vim.api.nvim_set_hl(0, 'DapUIStoppedThread', { fg = colors.blue, bg = 'none', underline = false, bold = true })

vim.api.nvim_set_hl(0, 'DapUIWatchesEmpty', { fg = colors.red, bg = 'none', underline = false, bold = true })
vim.api.nvim_set_hl(0, 'DapUIWatchesError', { fg = colors.red, bg = 'none', underline = false, bold = true })

vim.api.nvim_set_hl(0, 'DapUIRestartNC', { fg = colors.green, bg = 'none', underline = false, bold = true })
vim.api.nvim_set_hl(0, 'DapUIStopNC', { fg = colors.red, bg = 'none', underline = false, bold = true })

vim.api.nvim_set_hl(0, 'DapUIStepOverNC', { fg = colors.blue, bg = 'none', underline = false, bold = true })
vim.api.nvim_set_hl(0, 'DapUIStepIntoNC', { fg = colors.blue, bg = 'none', underline = false, bold = true })
vim.api.nvim_set_hl(0, 'DapUIStepOutNC', { fg = colors.blue, bg = 'none', underline = false, bold = true })
vim.api.nvim_set_hl(0, 'DapUIStepBackNC', { fg = colors.blue, bg = 'none', underline = false, bold = true })

vim.api.nvim_set_hl(0, 'DapUIStepOver', { fg = colors.blue, bg = 'none', underline = false, bold = true })
vim.api.nvim_set_hl(0, 'DapUIStepInto', { fg = colors.blue, bg = 'none', underline = false, bold = true })
vim.api.nvim_set_hl(0, 'DapUIStepOut', { fg = colors.blue, bg = 'none', underline = false, bold = true })
vim.api.nvim_set_hl(0, 'DapUIStepBack', { fg = colors.blue, bg = 'none', underline = false, bold = true })

vim.api.nvim_set_hl(0, 'DapUIUnavailableNC', { fg = colors.gray, bg = 'none', underline = false, bold = true })
vim.api.nvim_set_hl(0, 'DapUIPlayPauseNC', { fg = colors.green, bg = 'none', underline = false, bold = true })

vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, bg = "#3e322e", bold = false })


-- CMP
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { ctermbg = 0, fg = colors.white, bg = "none", bold = true })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { ctermbg = 0, fg = colors.white, bg = "none", bold = true })
vim.api.nvim_set_hl(0, 'CmpItemAbbr', { ctermbg = 0, fg = colors.white, bg = "none", bold = false })



vim.api.nvim_set_hl(0, "Normal", { bg = "none", ctermbg = 'none', force = true, nocombine = true })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none", ctermbg = 'none', force = true, nocombine = true })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none", ctermbg = 'none', force = true, nocombine = true })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none", ctermbg = 'none', force = true, nocombine = true })
vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none", ctermbg = 'none', force = true, nocombine = true })
vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none", ctermbg = 'none', force = true, nocombine = true })
vim.api.nvim_set_hl(0, "BufferLineFill", { bg = "none", ctermbg = 'none', force = true, nocombine = true })
vim.api.nvim_set_hl(0, "BufferLineTab", { bg = "none", ctermbg = 'none', force = true, nocombine = true })
vim.api.nvim_set_hl(0, "BufferLineTabSelected", { bg = "none", ctermbg = 'none', force = true, nocombine = true })
vim.api.nvim_set_hl(0, "BufferLineTabClose", { bg = "none", ctermbg = 'none', force = true, nocombine = true })
vim.api.nvim_set_hl(0, "BufferLineCloseButton", { bg = "none", ctermbg = 'none', force = true, nocombine = true })
vim.api.nvim_set_hl(0, "BufferLineSeparator", { bg = "none", ctermbg = 'none', force = true, nocombine = true })
vim.api.nvim_set_hl(0, "BufferLineSeparatorSelected", { bg = "none", ctermbg = 'none', force = true, nocombine = true })
vim.api.nvim_set_hl(0, "BufferLineSeparatorVisible", { bg = "none", ctermbg = 'none', force = true, nocombine = true })

vim.api.nvim_set_hl(0, "BufferlineFill",
    { bg = "NONE", fg = "NONE", ctermbg = "NONE", ctermfg = "NONE" })
vim.api.nvim_set_hl(0, "BufferLineBackground", {
    bg = "NONE",
    fg = "NONE",      -- Optional, remove if you want to keep the original foreground
    ctermbg = "NONE", -- Only relevant in terminals with cterm (e.g. Vim, not Neovim GUI)
    ctermfg = "NONE",
})
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none", nocombine = false })


vim.api.nvim_set_hl(0, "@todo-comments.backlog",
    { bg = "none", fg = colors.purple, force = true, nocombine = false, bold = true })
