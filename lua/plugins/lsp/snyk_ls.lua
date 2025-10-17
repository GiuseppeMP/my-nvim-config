local on_attach_options = require("plugins.lsp.utils.on_attach_options")
local capabilities_options = require("plugins.lsp.utils.capabilities_options")

local on_attach_snyk_ls = function(client, bufnr)
    vim.keymap.set("n", "<leader>ca", function() vim.cmd.RustLsp('codeAction') end, { silent = true, buffer = bufnr })

    -- default on_attach
    on_attach_options.get { format_on_save = false, format = true, lsp_client = 'snyk-ls' } (client, bufnr)
end


vim.lsp.config('snyk_ls', {
    on_attach = on_attach_snyk_ls,
    root_markers = { 'pom.xml', 'gradlew', 'mvnw', '.git', 'settings.gradle', '.lsp_root', '.snyk' },
    capabilities = capabilities_options.default
})
