local on_attach_options = require("plugins.lsp.utils.on_attach_options")
local capabilities_options = require("plugins.lsp.utils.capabilities_options")


local on_attach_vtsls = function(client, bufnr)
    vim.keymap.set("n", "<leader>ca", function() vim.cmd.RustLsp('codeAction') end, { silent = true, buffer = bufnr })
    -- default on_attach
    on_attach_options.get { format_on_save = false, format = false, lsp_client = 'vtsls' } (client, bufnr)
end


vim.lsp.config('vtsls', {
    on_attach = on_attach_vtsls,
    root_markers = { "tsconfig.json", "package.json", "jsconfig.json", ".git" },
    capabilities = capabilities_options.default

})
