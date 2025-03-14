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

vim.api.nvim_create_augroup('PersistencePlugin', { clear = true })
vim.api.nvim_create_autocmd("User", {
    group = 'PersistencePlugin',
    pattern = 'PersistenceLoadPost',
    callback = function(_event)
        vim.cmd("NvimTreeToggle")
    end
})
-- vim.api.nvim_create_autocmd("CursorHold", {
--     callback = function(_event)
--         vim.cmd("normal! m'")
--     end
-- })
vim.api.nvim_create_augroup('vim-test-runners', { clear = true })
vim.api.nvim_create_autocmd("VimEnter", {
    group = 'vim-test-runners',
    callback = function(_event)
        vim.cmd([[
            if filereadable("vite.config.ts")
                let test#javascript#runner = 'vitest'
                let test#typescript#runner = 'vitest'
            endif
        ]])
    end
})
vim.cmd [[

" When using `dd` in the quickfix list, remove the item from the quickfix list.
function! RemoveQFItem()
  let curqfidx = line('.') - 1
  let qfall = getqflist()
  call remove(qfall, curqfidx)
  call setqflist(qfall, 'r')
  execute curqfidx + 1 . "cfirst"
  :copen
endfunction
:command! RemoveQFItem :call RemoveQFItem()
" Use map <buffer> to only map dd in the quickfix window. Requires +localmap
autocmd FileType qf map <buffer> dd :RemoveQFItem<cr>

]]
