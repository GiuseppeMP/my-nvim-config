local icons = require 'user.icons'

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
--
-- lsp settings:
utils.init_err_handler('ansiblels', function() require "plugins.lsp.ansiblels" end)
utils.init_err_handler('cucumber_language_server', function() require "plugins.lsp.cucumber_ls" end)
utils.init_err_handler('cssls', function() require "plugins.lsp.cssls" end)
--utils.init_err_handler('ccls', function() require "plugins.lsp.ccls" end)
utils.init_err_handler('clangd', function() require "plugins.lsp.clangd" end)
utils.init_err_handler('dartls', function() require "plugins.lsp.dartls" end)
utils.init_err_handler('docker', function() require "plugins.lsp.docker" end)
utils.init_err_handler('eslint', function() require "plugins.lsp.eslint" end)
utils.init_err_handler('gopls', function() require "plugins.lsp.gopls" end)
utils.init_err_handler('html', function() require "plugins.lsp.html" end)
utils.init_err_handler('jdtls', function() require "plugins.lsp.jdtls" end)
utils.init_err_handler('jsonls', function() require "plugins.lsp.jsonls" end)
utils.init_err_handler('groovyls', function() require "plugins.lsp.groovyls" end)
utils.init_err_handler('lemminx', function() require "plugins.lsp.lemminx" end)
utils.init_err_handler('ltexls', function() require "plugins.lsp.ltexls" end)
utils.init_err_handler('lua_ls', function() require "plugins.lsp.lua_ls" end)
utils.init_err_handler('marksman', function() require "plugins.lsp.marksman" end)
utils.init_err_handler('pyright', function() require "plugins.lsp.pyright" end)
utils.init_err_handler('rust_analyzer', function() require "plugins.lsp.rust_analyzer" end)
utils.init_err_handler('terraformls', function() require "plugins.lsp.terraformls" end)
-- utils.init_err_handler('ts_ls', function() require "plugins.lsp.ts_ls" end)
utils.init_err_handler('typescript-tools', function() require "plugins.lsp.typescript-tools" end)
-- utils.init_err_handler('snyk-ls', function() require "plugins.lsp.snyk_ls" end)
utils.init_err_handler('yamlls', function() require "plugins.lsp.yamlls" end)
utils.init_err_handler('taplo', function() vim.lsp.config("taplo", {}) end)
-- utils.init_err_handler('vtsls', function() require "plugins.lsp.vtsls" end)

-- diagnostic signs
vim.fn.sign_define(
    'DiagnosticSignError',
    { text = icons.diagnostics.error, texthl = 'LspDiagnosticsDefaultError' }
)

vim.fn.sign_define(
    'DiagnosticSignWarn',
    { text = icons.diagnostics.warning, texthl = 'LspDiagnosticsDefaultWarning' }
)

vim.fn.sign_define(
    'DiagnosticSignInfo',
    { text = icons.diagnostics.info, texthl = 'LspDiagnosticsDefaultInformation' }
)

vim.fn.sign_define(
    'DiagnosticSignHint',
    { text = icons.diagnostics.hint, texthl = 'LspDiagnosticsDefaultHint' }
)

vim.cmd('highlight link LspDiagnosticsDefaultError DiagnosticError ')
vim.cmd('highlight link LspDiagnosticsDefaultWarning DiagnosticWarn ')
vim.cmd('highlight link LspDiagnosticsDefaultInformation DiagnosticInfo ')
vim.cmd('highlight link LspDiagnosticsDefaultHint DiagnosticHint ')


vim.diagnostic.config {
    underline        = false,
    virtual_text     = false,
    signs            = true,
    update_in_insert = true,
    severity_sort    = true,
    float            = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
}

-- vim.cmd([[ set signcolumn=yes autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false }) ]])
