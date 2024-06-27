return
{
    event = { "VeryLazy" },
    ft = 'markdown',
    build = "deno task --quiet build:fast",
    'toppair/peek.nvim',
    config = function()
        require('peek').setup()
        vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
        vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
    end
}
