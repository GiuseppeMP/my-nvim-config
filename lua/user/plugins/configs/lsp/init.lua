-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- lsp settings:
require "user.plugins.configs.lsp.ansiblels"
require "user.plugins.configs.lsp.eslint"
require "user.plugins.configs.lsp.html"
require "user.plugins.configs.lsp.jdtls"
require "user.plugins.configs.lsp.jsonls"
require "user.plugins.configs.lsp.lemminx"
require "user.plugins.configs.lsp.lua_ls"
require "user.plugins.configs.lsp.pyright"
require "user.plugins.configs.lsp.tsserver"
require "user.plugins.configs.lsp.yamlls"

-- borders
local border = {
    { "🭽", "FloatBorder" },
    { "▔",  "FloatBorder" },
    { "🭾", "FloatBorder" },
    { "▕",  "FloatBorder" },
    { "🭿", "FloatBorder" },
    { "▁",  "FloatBorder" },
    { "🭼", "FloatBorder" },
    { "▏",  "FloatBorder" },
}

-- To instead override border globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview

function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or border
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- vim.cmd('highlight LspDiagnosticsDefaultWarning guifg=warning guibg=none')
-- vim.cmd('highlight LspDiagnosticsDefaultInformation guifg=information guibg=none')
-- vim.cmd('highlight LspDiagnosticsDefaultHint guifg=hint guibg=none')

-- NvimTreePopup  xxx links to Normal
-- NvimTreeLspDiagnosticsError xxx links to DiagnosticError
-- NvimTreeLspDiagnosticsWarning xxx links to DiagnosticWarn
-- NvimTreeLspDiagnosticsInformation xxx links to DiagnosticInfo
-- NvimTreeLspDiagnosticsHint xxx links to DiagnosticHint


-- diagnostic signs
vim.fn.sign_define(
    'DiagnosticSignError',
    { text = '', texthl = 'LspDiagnosticsDefaultError' }
)

vim.fn.sign_define(
    'DiagnosticSignWarn',
    { text = '', texthl = 'LspDiagnosticsDefaultWarning' }
)

vim.fn.sign_define(
    'DiagnosticSignInfo',
    { text = '', texthl = 'LspDiagnosticsDefaultInformation' }
)

vim.fn.sign_define(
    'DiagnosticSignHint',
    { text = '', texthl = 'LspDiagnosticsDefaultHint' }
)

vim.cmd('highlight link LspDiagnosticsDefaultError DiagnosticError ')
vim.cmd('highlight link LspDiagnosticsDefaultWarning DiagnosticWarn ')
vim.cmd('highlight link LspDiagnosticsDefaultInformation DiagnosticInfo ')
vim.cmd('highlight link LspDiagnosticsDefaultHint DiagnosticHint ')
