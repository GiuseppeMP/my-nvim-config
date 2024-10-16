local function config()
    require 'boole'.setup({
        mappings = {
            increment = '<C-a>',
            decrement = '<C-x>'
        },
        -- User defined loops
        additions = {
            { 'private', 'public',       'protected' },
            { 'String',  'List<String>' },
            { 'int',     'float32',      'string',    'bool' },
            { 'Integer', 'List<Integer>' },
            { 'require', 'import',       'export' },
            { 'at',      'on',           'in' },
            { 'or',      'and' },
        },

    })
end
return
{ 'nat-418/boole.nvim', config = config }
