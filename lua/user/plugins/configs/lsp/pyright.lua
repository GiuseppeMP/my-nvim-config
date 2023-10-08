local on_attach_pyright = function(client, bufnr)
    -- default on_attach
    require("user.plugins.configs.lsp.utils.on_attach_options").get { format_on_save = true, format = true, lsp_client =
    'pyright' } (client, bufnr)
end

require('lspconfig').pyright.setup {
    on_attach = on_attach_pyright,
    capabilities = require 'user.plugins.configs.lsp.utils.capabilities_options'.default,
    filetypes = { "python" },
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "openFilesOnly",
                useLibraryCodeForTypes = true
            }
        }
    }
}
