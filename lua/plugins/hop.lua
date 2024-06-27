return {
    -- better easymotion
    {
        "smoka7/hop.nvim",
        config = function()
            local querty_home_row = 'asdfghjkl;';
            -- local colemak_dh_home_row = 'arstgmneio';
            require 'hop'.setup({ keys = querty_home_row .. 'woei' })
        end,
        version = "*"
    },
}
