local on_attach_options = require("plugins.lsp.utils.on_attach_options")
local capabilities_options = require("plugins.lsp.utils.capabilities_options")
require "mason"

-- mason utils to get installation path
local get_package_install_path = function(package_name)
    return vim.fn.expand("$MASON/packages/" .. package_name)
    -- mason installations registry
    -- local mason_registry = require("mason-registry");
    -- return mason_registry.get_package(package_name):get_install_path()
end

local groovyls_exec = get_package_install_path('groovy-language-server')

local root_markers = { 'pom.xml', 'gradlew', 'mvnw', '.git', 'settings.gradle', '.lsp_root' }

local groovy_lint = get_package_install_path('npm-groovy-lint')

local format = {
    -- formatCommand = [[npx npm-groovy-lint --format ${INPUT} - ]],
    formatCommand = "npx npm-groovy-lint --format -",
    formatStdin = true,
}

-- root dir, workspace and project name
local root_dir = function() return require('jdtls.setup').find_root(root_markers) end

-- vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format()' ]])

vim.lsp.config('groovyls', {
    on_attach = on_attach_options.get {
        lsp_client = 'groovyls',
        format_on_save = true,
        format = true,
    },
    capabilities = capabilities_options.default,
    root_dir = root_dir,
    filetypes = { "groovy" },
    init_options = { documentFormatting = true },
    settings = {
        languages = {
            groovy = { format },
        },
    },
    cmd = { "java", "-jar", groovyls_exec .. "/build/libs/groovy-language-server-all.jar" }
})

vim.lsp.enable('groovyls')
