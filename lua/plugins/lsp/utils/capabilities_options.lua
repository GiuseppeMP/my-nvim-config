M = {}

M.get = function(params)
    local caps = vim.lsp.protocol.make_client_capabilities()
    if caps.workspace then
        caps.workspace.didChangeWatchedFiles = nil
    end
    caps.textDocument.completion.completionItem.snippetSupport = true
    if (params.cmp_nvim == nil or params.cmp_nvim) then
        -- caps = require('cmp_nvim_lsp').default_capabilities(caps)
        -- if caps.workspace then
        --     caps.workspace.didChangeWatchedFiles = nil
        -- end
        -- return caps
    end
end

M.default = M.get({ cmp_nvim = true })

return M
