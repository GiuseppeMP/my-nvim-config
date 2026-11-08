local function config()
    require 'boole'.setup({
        mappings = {
            increment = '<C-a>',
            decrement = '<C-x>'
        },
        -- User defined loops
        additions = {
            { 'private',    'public',       'protected' },
            { 'require',    'import',       'export' },
            { 'String',     'List<String>' },
            { 'Integer',    'List<Integer>' },
            { 'who',        'what',         'when',     'why',    'where' },
            { 'int',        'float32',      'string',   'bool' },
            { 'openrouter', 'claude',       'openai',   'ollama', 'grok4', 'gemini' },
            { 'at',         'on',           'in',       'off' },
            { 'or',         'and',          'xor',      'xand' },
        },

    })
end
return
{ 'nat-418/boole.nvim', config = config }
