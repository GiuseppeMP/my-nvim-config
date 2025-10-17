local filetypes = { "c", "cpp", "objc", "objcpp", "opencl" }
local on_attach_options = require("plugins.lsp.utils.on_attach_options")
local capabilities_options = require("plugins.lsp.utils.capabilities_options")

vim.lsp.config('clangd', {
    filetypes = filetypes,
    -- root_dir = lspconfig.util.root_pattern("build/compile_commands.json", "compile_commands.json", "compile_flags.txt",
    --     "CMakeLists.txt"),
    on_attach = on_attach_options.get { lsp_client = 'clangd' },
    capabilities = capabilities_options.get({ cmp_nvim = true, snippetSupport = false }),

    init_options = {
        compilationDatabaseDirectory = "build",
        index = {
            threads = 2,
        },
        clang = {
            excludeArgs = { "-frounding-math" },
        },
    }
})
