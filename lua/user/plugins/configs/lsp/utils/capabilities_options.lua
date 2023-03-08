M = {}

M.get = function(params)
    local client_capabilities = vim.lsp.protocol.make_client_capabilities()

    if(params.cmp_nvim == nil or params.cmp_nvim) then
        return require('cmp_nvim_lsp').default_capabilities(client_capabilities)
    else
        return client_capabilities
    end
end

M.default = M.get { cmp_nvim = true }

return M
