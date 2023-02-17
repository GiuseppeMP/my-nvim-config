local g = vim.g -- For the globals options
local api = vim.api
local opt = vim.opt

g.coc_global_extensions = {
    'coc-emoji',
    -- 'coc-vimlsp',
    -- 'coc-java-vimspector',
    -- 'coc-json',
    -- 'coc-git',
    -- 'coc-java-debug',
    -- 'coc-java',
    -- 'coc-markdownlint',
    -- 'coc-tsserver',
    -- 'coc-marketplace',
    'coc-snippets',
    -- 'coc-explorer',
    -- 'coc-lua',
    'coc-fzf-preview',
    -- 'coc-go'
    -- 'coc-pairs'
}

g.coc_disable_transparent_cursor = 1
g.coc_snippet_next = '<tab>'

-- -- Highlight the symbol and its references when holding the cursor.
-- api.nvim_create_augroup("CocGroup", {})
-- api.nvim_create_autocmd("CursorHold", {
--     group = "CocGroup",
--     command = "silent call CocActionAsync('highlight')",
--     desc = "Highlight symbol under cursor on CursorHold"
-- })

-- -- Setup formatexpr specified filetype(s).
-- api.nvim_create_autocmd("FileType", {
--     group = "CocGroup",
--     pattern = "typescript,json",
--     command = "setl formatexpr=CocAction('formatSelected')",
--     desc = "Setup formatexpr specified filetype(s)."
-- })

-- -- Update signature help on jump placeholder.
-- api.nvim_create_autocmd("User", {
--     group = "CocGroup",
--     pattern = "CocJumpPlaceholder",
--     command = "call CocActionAsync('showSignatureHelp')",
--     desc = "Update signature help on jump placeholder"
-- })


-- Add `:Format` command to format current buffer.
-- api.nvim_create_user_command("Format", "call CocAction('format')", {})

-- " Add `:Fold` command to fold current buffer.
-- api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", {nargs = '?'})

-- Add `:OR` command for organize imports of the current buffer.
-- api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})

-- Add (Neo)Vim's native statusline support.
-- NOTE: Please see `:h coc-status` for integrations with external plugins that
-- provide custom statusline: lightline.vim, vim-airline.
opt.statusline:prepend("%{coc#status()}%{get(b:,'coc_current_function','')}")
