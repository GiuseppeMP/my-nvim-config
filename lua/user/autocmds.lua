vim.cmd([[
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
augroup END
]])

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = "*rc^",
    desc = "set syntax=sh to rc files like zshrc and bashrc and etc",
    command = "set syntax=sh"
})

vim.api.nvim_create_autocmd("InsertLeave", {
    pattern = "*",
    desc = "set nopaste when leaving insert mode, to avoid pasting in normal mode",
    command = "set nopaste"
})

vim.api.nvim_create_autocmd('FileType', {
    -- pattern = 'workspace.dsl',
    pattern = 'structurizr',
    callback = function()
        local client = vim.lsp.start({
            name = 'c4-language-server',
            cmd = { '/Users/giuseppemp/.config/packages/c4-dsl/c4-language-server/bin/c4-language-server' },
            root_dir = vim.fs.dirname(vim.fs.find({ 'workspace.dsl', ".git" }, { upward = true })[1]),
        })
        vim.lsp.buf_attach_client(0, client)
    end,
})
local function is_no_name_buf(buf)
    return
        vim.api.nvim_buf_is_loaded(buf)
        and vim.api.nvim_buf_get_option(buf, 'buflisted')
        and vim.api.nvim_buf_get_name(buf) == ''
        and vim.api.nvim_buf_get_option(buf, 'buftype') == ''
        and vim.api.nvim_buf_get_option(buf, 'filetype') == ''
end
-- open Alpha when all buffers are closed
vim.api.nvim_create_autocmd("BufDelete", {
    callback = function(event)
        local fallback_name = vim.api.nvim_buf_get_name(event.buf)
        local fallback_ft = vim.api.nvim_buf_get_option(event.buf, "filetype")
        local fallback_on_empty = fallback_name == "" and fallback_ft == ""
        local bufNr = vim.api.nvim_get_current_buf()

        if (bufNr ~= '' and bufNr == 1 and not is_no_name_buf(bufNr)) then
            return
        end
        if fallback_on_empty and not is_no_name_buf(bufNr) then
            vim.cmd("Alpha")
        end
    end,
})

vim.api.nvim_create_augroup('PersistencePlugin', { clear = true })
vim.api.nvim_create_autocmd("User", {
    group = 'PersistencePlugin',
    pattern = 'PersistenceLoadPost',
    callback = function(_event)
        vim.cmd("NvimTreeToggle")
    end
})
