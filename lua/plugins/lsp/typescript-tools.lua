local on_attach_options = require("plugins.lsp.utils.on_attach_options")

require("typescript-tools").setup {
    settings = {
        separate_diagnostic_server = true,
        publish_diagnostic_on = "insert_leave",
        expose_as_code_action = "all",
        complete_function_calls = true,
        code_lens = "on"
    },
    filetypes = {
        "typescript",
        "vue",
        "javascript"
    },
    on_attach = on_attach_options.get({
        inlay = true,
        format_on_save = false,
        rename = true,
        format = false,
        lsp_client = 'typescript-tools'
    }),
}
