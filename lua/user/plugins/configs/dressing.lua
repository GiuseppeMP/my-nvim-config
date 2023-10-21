local status_ok, dressing = pcall(require, "dressing")
if not status_ok then
    return
end

dressing.setup({

    input = {
        -- enabled = true,
        relative = "cursor",
        win_options = {
            winblend = 0,
        },
    },

    select = {
        -- backend = { "telescope", "nui", "builtin" },
        border = "rounded",
        get_config = function(opts)
            if opts.kind == 'codeaction' then
                return {
                    backend = 'nui',
                    nui = {
                        relative = 'cursor',
                        max_width = 40,
                    }
                }
            end
        end
    }

})
