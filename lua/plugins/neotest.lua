local function config()
    local function safe_require(module_name)
        local ok, module = pcall(require, module_name)
        if ok then
            return module
        end

        vim.schedule(function()
            vim.notify(
                ("neotest adapter unavailable: %s"):format(module_name),
                vim.log.levels.WARN
            )
        end)

        return nil
    end

    local function build_vim_test_adapter()
        local adapter_factory = safe_require("neotest-vim-test")
        if not adapter_factory then
            return nil
        end

        local adapter = adapter_factory({
            ignore_file_types = { "lua", "javascript", "typescript", "python" },
            allow_file_types = { "java" }
        })

        -- `neotest-vim-test` delegates to a subprocess that does a fresh `require`.
        -- In this setup that subprocess does not see the adapter module on its package path,
        -- so force the in-process implementation instead of crashing on CursorHold/test discovery.
        adapter.is_test_file = adapter._is_test_file
        adapter.discover_positions = adapter._discover_positions
        adapter.build_spec = adapter._build_spec

        return adapter
    end

    local adapters = vim.tbl_filter(function(adapter)
        return adapter ~= nil
    end, {
        safe_require("neotest-vitest"),
        safe_require("neotest-golang"),
        -- safe_require("neotest-gradle"),
        (function()
            local jest = safe_require("neotest-jest")
            if not jest then
                return nil
            end

            return jest({
                -- jestCommand = "npx jest --watch ",
                jestCommand = "npm test --",
                jestConfigFile = "jest.config.json",
                env = { CI = true },
                jest_test_discovery = true,
                cwd = function(_)
                    return vim.fn.getcwd()
                end,
            })
        end)(),
        safe_require("neotest-plenary"),
        build_vim_test_adapter(),
        (function()
            local python = safe_require("neotest-python")
            if not python then
                return nil
            end

            return python({
                dap = { justMyCode = true },
                args = { "--log-level", "DEBUG" }
            })
        end)(),
    })

    vim.cmd([[
    let test#python#runner = 'pytest'
    let test#javascript#runner = 'jest'
    let test#typescript#runner = 'jest'
]])
    require('dap-go').setup {
        dap_configurations = {
            {
                type = "go",
                name = "Attach remote",
                mode = "remote",
                request = "attach",
            },
        },
    }
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
            enabled = true,
        },
        running = {
            concurrent = false
        },
        adapters = adapters,
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
