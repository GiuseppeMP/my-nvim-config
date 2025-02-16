return {
    {
        'TobinPalmer/pastify.nvim',
        cmd = { 'Pastify', 'PastifyAfter' },
        ft = "md",
        keys = {
            { noremap = true, mode = "x", '<leader>up', "<cmd>PastifyAfter<CR>" },
            { noremap = true, mode = "n", '<leader>up', "<cmd>PastifyAfter<CR>" },
            { noremap = true, mode = "n", '<leader>uP', "<cmd>Pastify<CR>" },
        },
        config = function()
            require('pastify').setup {
                opts = {
                    absolute_path = false,        -- use absolute or relative path to the working directory
                    apikey = '',                  -- Api key, required for online saving
                    local_path = '/assets/imgs/', -- The path to put local files in, ex ~/Projects/<name>/assets/images/<imgname>.png
                    save = 'local',               -- Either 'local' or 'online'
                },
                ft = {                            -- Custom snippets for different filetypes, will replace $IMG$ with the image url
                    html = '<img src="$IMG$" alt="">',
                    markdown = '![]($IMG$)',
                    tex = [[\includegraphics[width=\linewidth]{$IMG$}]],
                },
            }
        end
    },
}
