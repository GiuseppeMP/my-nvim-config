local function config()
    local function null_ls()
        local null_ls = require 'null-ls'
        local formatting = null_ls.builtins.formatting
        -- local diagnostics = null_ls.builtins.diagnostics
        -- local code_actions = null_ls.builtins.code_actions

        null_ls.setup({
            sources = {
                formatting.autopep8,
                formatting.npm_groovy_lint
                -- diagnostics.pycodestyle,
                -- diagnostics.pydocstyle,
                -- diagnostics.pylint,
                -- code_actions.refactoring -- disabled due nvimtree width issue
            }
        })
    end
end
return { 'jose-elias-alvarez/null-ls.nvim', config = config }
