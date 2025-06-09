return
-- better folding (using treesitter, lsp, etc)
{
    "kevinhwang91/nvim-ufo",
    dependencies = { 'kevinhwang91/promise-async' },
    config = function()
        vim.o.foldcolumn = '1' -- '0' is not bad
        vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
        vim.o.foldlevelstart = 99
        vim.o.foldenable = true
        require 'ufo'.setup({
            provider_selector = function(_, _, _)
                return { 'treesitter', 'indent' }
            end
        })
    end,
}
