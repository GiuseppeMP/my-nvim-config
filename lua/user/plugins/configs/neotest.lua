require("neotest").setup({
    status = {
        signs = true,
        virtual_text = false
    },
    running = {
        concurrent = false
    },
    discovery = {
        concurrent = 1,
        enabled = true
    },
    adapters = {
        require('neotest-jest')({
            -- jestCommand = "npx jest --watch ",
            jestCommand = "npm test --",
            -- jestConfigFile = "custom.jest.config.ts",
            env = { CI = true },
            cwd = function(_)
                return vim.fn.getcwd()
            end,
        }),
        require("neotest-plenary"),
        require("neotest-vim-test")({ ignore_filetypes = { "python", "lua" }, allow_file_types = { "java" } }),
        require("neotest-python")(
            {
                dap = { justMyCode = true },
                args = { "--log-level", "DEBUG" },
            }
        )
    },
    quickfix = {
        enabled = false,
        open = false,
    },
    output = {
        enabled = false,
    },
    icons = {
        unknown = conf.icons.question,
        passed = conf.icons.check_fa,
        failed = conf.icons.remove_fa,
        running = conf.icons.repeat_fa,
        skipped = conf.icons.skip,
        running_animated = { "⡀", "⡄", "⡆", "⡇", "⡇", "⡆", "⡄", "⡀" }
    }
})

-- f6c177  yellow
-- c4a7e7  magenta
-- eb6f92  red
-- 908caa  gray
-- 9ccfd8  lightBlue
-- e0def4  white
vim.cmd('hi NeotestRunning guifg=#f6c177')
vim.cmd('hi NeotestDir guifg=#e0def4')
vim.cmd('hi NeotestFile guifg=#c4a7e7')
vim.cmd('hi NeotestFailed guifg=#eb6f92')
vim.cmd('hi NeotestTest guifg=#9ccfd8')
vim.cmd('hi NeotestUnknown guifg=#908caa')
vim.cmd('hi NeotestAdapterName guifg=#eb6f92')
vim.cmd('hi NeotestNamespace guifg=#908caa')
