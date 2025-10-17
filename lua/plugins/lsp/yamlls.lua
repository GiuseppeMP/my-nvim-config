local on_attach_options = require("plugins.lsp.utils.on_attach_options")
local capabilities_options = require("plugins.lsp.utils.capabilities_options")

vim.lsp.config('yamlls', {
    -- format options delegated to eslint lsp
    on_attach = on_attach_options.get({ format_on_save = true, format = true, lsp_client = 'yamlls' }),
    capabilities = capabilities_options.default,
    settings = {
        redhat = {
            telemetry = {
                enabled = false
            },
        },
        yaml = {
            keyOrdering = false
        }
    },
    filetypes = { 'yaml', 'yml', 'yaml.docker-compose' }

})
