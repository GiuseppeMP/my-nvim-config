local null_ls = require 'null-ls'

local formatting = null_ls.builtins.formatting
-- local diagnostics = null_ls.builtins.diagnostics
-- local code_actions = null_ls.builtins.code_actions

null_ls.setup({
    sources = {
        formatting.autopep8,
        -- diagnostics.pycodestyle,
        -- diagnostics.pydocstyle,
        -- diagnostics.pylint,
        -- code_actions.refactoring -- disabled due nvimtree width issue
    }
})
