local on_attach_options = require("plugins.lsp.utils.on_attach_options")
local capabilities_options = require("plugins.lsp.utils.capabilities_options")

vim.lsp.config("ansiblels", {
    -- format options delegated to eslint lsp
    on_attach = on_attach_options.get({ format_on_save = false, format = false, lsp_client = 'ansiblels' }),
    capabilities = capabilities_options.default,
    -- need to fix filetypes, It can't attach in all y(a)ml files.
    -- :set ft=yaml.ansible brokes treesitter
    filetypes = {
        "yaml.ansible",
        "yml.ansible",
    },
    root_dir = require 'lspconfig.util'.root_pattern('ansible.cfg', '.ansible-lint'),
    single_file_support = true
})
