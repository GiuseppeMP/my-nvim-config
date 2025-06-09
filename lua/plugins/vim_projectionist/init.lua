local heuristics_modules = {
    'go',
    'java',
    'javascript',
    'python',
    'ruby',
}

local function config()
    local tbHeuristics = vim.g.projectionist_heuristics or {}

    for _, mod in pairs(heuristics_modules) do
        local heuristic = require('plugins.vim_projectionist.' .. mod)
        tbHeuristics[heuristic.activation] = heuristic.config
    end

    vim.g.projectionist_heuristics = tbHeuristics
end

return {
    { 'tpope/vim-projectionist', config = config },
}
