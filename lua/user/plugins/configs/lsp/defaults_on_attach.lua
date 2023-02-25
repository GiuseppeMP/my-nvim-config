-- lsp default on_attach
local on_attach = function(_, bufnr)

    local buf_opts = { noremap=true, silent=false, buffer=bufnr }

    -- Disable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, buf_opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, buf_opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, buf_opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, buf_opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, buf_opts)

    -- Ctrl
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, buf_opts)

    --leader
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, buf_opts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, buf_opts)
    vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, buf_opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, buf_opts)
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, buf_opts)
    vim.keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, buf_opts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, buf_opts)

end

local border = {
      {"🭽", "FloatBorder"},
      {"▔", "FloatBorder"},
      {"🭾", "FloatBorder"},
      {"▕", "FloatBorder"},
      {"🭿", "FloatBorder"},
      {"▁", "FloatBorder"},
      {"🭼", "FloatBorder"},
      {"▏", "FloatBorder"},
}

-- To instead override globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview

function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

return on_attach
