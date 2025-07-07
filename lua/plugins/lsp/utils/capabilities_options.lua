M = {}

M.get = function(params)
    -- local caps = vim.lsp.protocol.make_client_capabilities()
    local caps = require('blink.cmp').get_lsp_capabilities()
    if caps.workspace then
        caps.workspace.didChangeWatchedFiles = nil
    end
    if (params.cmp_nvim == nil or params.cmp_nvim) then
        -- caps = require('cmp_nvim_lsp').default_capabilities(caps)
        -- if caps.workspace then
        --     caps.workspace.didChangeWatchedFiles = nil
        -- end
        -- return caps
    end
    caps.textDocument.completion.completionItem.snippetSupport = true
    return caps
end

M.default = M.get({ cmp_nvim = false, blink = true })

return M
