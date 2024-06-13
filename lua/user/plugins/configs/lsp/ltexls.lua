---@diagnostic disable: need-check-nil
local on_attach_options = require("user.plugins.configs.lsp.utils.on_attach_options")
local capabilities_options = require("user.plugins.configs.lsp.utils.capabilities_options")
local lspconfig = require 'lspconfig'

-- ===========================================
--  Add user dictionary for ltex-ls
--  Resolve problem of not saving new works.
--  * en.utf-8.add must be created using `zg` when set spell is on
-- ===========================================
local path = vim.fn.stdpath 'data' .. '/ltex/dictionaries/en.utf-8.add'
local words = {}

local create_json_data = function(dicio_path)
    if not utils.file_exists(dicio_path) then
        os.execute("mkdir -p " .. dicio_path:match("(.*/)"))
        local fp = io.open(dicio_path, 'w+')
        fp:close()
    end
end

create_json_data(path)

for word in io.open(path, 'r'):lines() do
    table.insert(words, word)
end

lspconfig.ltex.setup {
    on_attach = on_attach_options.get { lsp_client = 'ltex' },
    capabilities = capabilities_options.default,
    settings = {
        ltex = {
            language = { 'en-US', 'pt-BR' },
            dictionary = {
                ['en-US'] = words,
                ['en-GB'] = words,
            },
        }
    },
    filetypes = {
        "ltex",
    },

}
