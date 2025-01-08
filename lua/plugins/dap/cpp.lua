local dap = require('dap')

-- Caminho para o adaptador codelldb
local codelldb_path = vim.fn.stdpath('data') .. '/mason/packages/codelldb/extension/adapter/codelldb'
local liblldb_path = vim.fn.stdpath('data') .. '/mason/packages/codelldb/extension/lldb/lib/liblldb.so'

dap.adapters.lldb = {
    type = 'server',
    port = "${port}",
    executable = {
        command = codelldb_path,
        args = { "--port", "${port}" },
        -- Caso necessário, configure variáveis de ambiente:
        env = function()
            return {
                LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES",
            }
        end,
    },
}

dap.configurations.cpp = {
    {
        name = "Launch",
        type = "lldb",
        request = "launch",
        program = function()
            -- Solicita ao usuário para informar o binário executável
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/bin/main', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {}, -- Argumentos opcionais para o executável
        runInTerminal = true,
    },
}

-- Alias para C e Rust, caso use
dap.configurations.c = dap.configurations.cpp
