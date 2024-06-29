local on_attach_options = require("plugins.lsp.utils.on_attach_options")
local capabilities_options = require("plugins.lsp.utils.capabilities_options")
local lspconfig = require 'lspconfig'

-- dartls is available in the dart sdk: https://dart.dev/get-dart
lspconfig.dartls.setup {
    on_attach = on_attach_options.get({ format_on_save = true, format = true, lsp_client = 'dartls' }),
    capabilities = capabilities_options.default,
    single_file_support = true,
    init_options = {
        closingLabels = true,
        flutterOutline = true,
        onlyAnalyzeProjectsWithOpenFiles = true,
        outline = true,
        suggestFromUnimportedLibraries = true
    },
    settings = {
        dart = {
            completeFunctionCalls = true,
            showTodos = true
        }
    }
}
