local on_attach_options = require("plugins.lsp.utils.on_attach_options")
local capabilities_options = require("plugins.lsp.utils.capabilities_options")

vim.lsp.config('ts_ls', {
    -- format options delegated to eslint lsp
    on_attach = on_attach_options.get({
        inlay = false,
        format_on_save = true,
        rename = true,
        format = true,
        lsp_client = 'ts_ls'
    }),
    filetypes = {
        -- "typescript", --using typescript-tools for ts.
        "javascript",
        "vue",
    },
    init_options = {
        hostInfo = "neovim",
        preferences = {
            includeInlayParameterNameHints = 'all',
            includeInlayParameterNameHintsWhenArgumentMatchesName = true,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
            importModuleSpecifierPreference = 'non-relative',
        },
    },
    capabilities = capabilities_options.default
})
