local lspconfig = require 'lspconfig'
local on_attach_options = require("user.plugins.configs.lsp.utils.on_attach_options")
local capabilities_options = require("user.plugins.configs.lsp.utils.capabilities_options")

local on_attach_rust_analyzer = function(client, bufnr)

    vim.keymap.set("n", "<leader>ca", function() vim.cmd.RustLsp('codeAction') end, { silent = true, buffer = bufnr })

    -- default on_attach
    on_attach_options.get { format_on_save = true, format = true, lsp_client = 'rust-analyzer' }(client, bufnr)
end

-- lspconfig.rust_analyzer.setup {
--     on_attach = on_attach_rust_analyzer,
--     capabilities = capabilities_options.default
-- }

vim.g.rustaceanvim = {
  -- Plugin configuration tools = { },
  -- LSP configuration
  server = {
    on_attach = on_attach_rust_analyzer,
    capabilities = capabilities_options.default,
    settings = {
      -- rust-analyzer language server configuration
      ['rust-analyzer'] = { },
    },
  },
  -- DAP configuration dap = { },
}
