local on_attach_options = require("plugins.lsp.utils.on_attach_options")
local capabilities_options = require("plugins.lsp.utils.capabilities_options")

vim.lsp.config('docker_compose_language_service', {
    on_attach = on_attach_options.get { lsp_client = 'docker_compose_language_service' },
    capabilities = capabilities_options.default
})

vim.lsp.config('dockerls', {
    on_attach = on_attach_options.get { lsp_client = 'dockerls' },
    capabilities = capabilities_options.default
})
