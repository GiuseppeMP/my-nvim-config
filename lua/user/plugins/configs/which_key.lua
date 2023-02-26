vim.g.which_key_timeout=300

local wk = require "which-key"

local conf = {
    ignore_missing = true,
    window = {
        border = "double", -- none, single, double, shadow
        position = "bottom", -- bottom, top
    },
}

wk.setup(conf)
