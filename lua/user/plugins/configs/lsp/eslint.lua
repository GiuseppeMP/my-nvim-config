local lspconfig = require 'lspconfig'
local on_attach_options = require("user.plugins.configs.lsp.utils.on_attach_options")
local capabilities_options = require("user.plugins.configs.lsp.utils.capabilities_options")

lspconfig.eslint.setup {
    on_attach = on_attach_options.get { lsp_client = 'eslint', format_on_save = true, format = true },
    capabilities = capabilities_options.default,
    settings = {
        codeActionOnSave = {
            enable = true,
            mode = "all",
        },
        autoFixOnSave = true,
        codeAction = {
            disableRuleComment = {
                enable = true,
                location = "separateLine"
            },
            showDocumentation = {
                enable = true
            }
        },
        experimental = {
            useFlatConfig = false
        },
        format = true,
        nodePath = "",
        onIgnoredFiles = "off",
        packageManager = "npm",
        problems = {
            shortenToSingleLine = false
        },
        quiet = false,
        rulesCustomizations = {},
        run = "onType",
        useESLintClass = false,
        validate = "on",
        workingDirectory = {
            mode = "location"
        }
    }
}
