local on_attach_options = require("plugins.lsp.utils.on_attach_options")

require("typescript-tools").setup {
    on_attach = on_attach_options.get({
        inlay = false,
        format_on_save = true,
        rename = true,
        format = true,
        lsp_client = 'typescript-tools'
    }),
}
