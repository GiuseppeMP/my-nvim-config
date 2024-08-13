local function config()
    vim.cmd([[
    let test#python#runner = 'pytest'
    let test#javascript#runner = 'jest'
    let test#typescript#runner = 'jest'
]])

    require("neotest").setup({
        status = {
            signs = true,
            virtual_text = false
        },
        diagnostic = {
            enabled = true,
            severity = 1,
        },
        discovery = {
            enabled = false,
        },
        running = {
            concurrent = false
        },
        adapters = {
            require("neotest-vitest"),
            require("neotest-golang"),
            require("neotest-gradle"),
            require('neotest-jest')({
                -- jestCommand = "npx jest --watch ",
                jestCommand = "npm test --",
                jestConfigFile = "jest.config.mjs",
                env = { CI = true },
                jest_test_discovery = true,
                cwd = function(_)
                    return vim.fn.getcwd()
                end,
            }),
            require("neotest-plenary"),
            require("neotest-vim-test")({
                ignore_filetypes = { "lua", "javascript", "typescript" },
                allow_file_types = { "python", "java" }
            }),
            -- require("neotest-java"),
            -- -- require("neotest-python")(
            --     {
            --         dap = { justMyCode = true },
            --         args = { "--log-level", "DEBUG" },
            --     }
            -- )
        },
        quickfix = {
            enabled = true,
            open = true,
        },
        output = {
            enabled = true,
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
end
return {
    {
        'nvim-neotest/neotest',
        keys = {
            {
                "<leader>td",
                function()
                    require("neotest").run.run({ suite = false, strategy = "dap" })
                end,
                desc = "Debug nearest test",
            },
        },
        config = config,
        dependencies = {
            "nvim-neotest/nvim-nio",
            'marilari88/neotest-vitest',
            'nvim-neotest/neotest-python',
            'nvim-neotest/neotest-plenary',
            'andy-bell101/neotest-java',
            'vim-test/vim-test',
            'nvim-neotest/neotest-vim-test',
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "weilbith/neotest-gradle"
        },
    },
    {
        "fredrikaverpil/neotest-golang", -- Installation
        dependencies = { "leoluz/nvim-dap-go", }
    },
    {
        'nvim-neotest/neotest-jest',
        dependencies = { "nvim-treesitter/nvim-treesitter", 'nvim-neotest/neotest' },
    },
}
