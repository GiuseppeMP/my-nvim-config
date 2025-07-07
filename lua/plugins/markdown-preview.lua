return
{
    'iamcco/markdown-preview.nvim',
    event = { "VeryLazy" },
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
        vim.cmd [[Lazy load markdown-preview.nvim]]
        vim.fn['mkdp#util#install']()
    end,
    -- build = function() vim.fn["mkdp#util#install"]() end,
}
