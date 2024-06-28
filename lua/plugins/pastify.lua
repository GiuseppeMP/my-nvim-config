return { {
    'TobinPalmer/pastify.nvim',
    cmd = { 'Pastify' },
    config = function()
        require('pastify').setup {
            opts = {
                absolute_path = false,            -- use absolute or relative path to the working directory
                apikey = '',                      -- Api key, required for online saving
                local_path = '/assets/imgs/',     -- The path to put local files in, ex ~/Projects/<name>/assets/images/<imgname>.png
                save = 'local',                   -- Either 'local' or 'online'
            },
            ft = {                                -- Custom snippets for different filetypes, will replace $IMG$ with the image url
                html = '<img src="$IMG$" alt="">',
                markdown = '![]($IMG$)',
                tex = [[\includegraphics[width=\linewidth]{$IMG$}]],
            }, }
    end
},
}
