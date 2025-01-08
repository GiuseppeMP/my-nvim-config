local jdtls = require 'jdtls'
local jdtls_tests = require 'jdtls.tests'
local on_attach_options = require("plugins.lsp.utils.on_attach_options")
-- mason installations registry
local mason_registry = require("mason-registry");

-- mason utils to get installation path
local get_package_install_path = function(package_name)
    return mason_registry.get_package(package_name):get_install_path()
end

-- home dir
local home = os.getenv "HOME"
local java_8 = os.getenv "JAVA_8"
local java_11 = os.getenv "JAVA_11"
local java_14 = os.getenv "JAVA_14"
local java_17 = os.getenv "JAVA_17"
local java_19 = os.getenv "JAVA_19"
local java_21 = os.getenv "JAVA_21"


-- maybe needs to improve marks because multimodule projects (maven/gradle)
local root_markers = { 'pom.xml', 'gradlew', 'mvnw', '.git', 'settings.gradle', '.lsp_root' }

-- root dir, workspace and project name
local root_dir = function() return require('jdtls.setup').find_root(root_markers) end

-- project name is assumed by the folder name
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

-- eclipse needs to create workspace settings folder, you can reset it using :JdtWipeDataAndRestart
local workspace_folder = function() return vim.fn.stdpath "data" .. "/jdtls/workspace_root/" .. project_name end

-- lombok jar path
local lombok_jar = vim.fn.glob(home .. '/.config/nvim/lua/plugins/lsp/files/jdtls/lombok-*.jar')

-- jdtls path
local jdtls_path = get_package_install_path('jdtls')

-- WIP
local go_to_with_options = function()
    vim.ui.select({ 'vertical', 'horizontal', 'float', 'tab' }, {
        prompt = "Jump style",
        telescope = require("telescope.themes").get_cursor(),
    }, function(selected)
        -- open goto using the selected option
        print(selected)
    end)
end

-- on_attach custom for nvim-jdtls
local on_attach_jdtls = function(_client, buf_nr)
    -- default on_attach
    require("plugins.lsp.utils.on_attach_options").get { format_on_save = true, format = true, lsp_client =
    'jdtls' } (_client, buf_nr)

    local buf_opts = { noremap = true, silent = false, buffer = buf_nr }
    vim.keymap.set('n', 'df', jdtls.test_class, buf_opts)
    vim.keymap.set('n', 'dn', jdtls.test_nearest_method, buf_opts)
    vim.keymap.set('n', '<leader>gt', jdtls_tests.generate, buf_opts)
    -- vim.keymap.set('n', '<leader>gT', go_to_with_options, buf_opts)

    vim.cmd [[
        nnoremap <D-o> <Cmd>lua require'jdtls'.organize_imports()<CR>
        nnoremap crv <Cmd>lua require('jdtls').extract_variable()<CR>
        vnoremap crv <Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>
        nnoremap crc <Cmd>lua require('jdtls').extract_constant()<CR>
        vnoremap crc <Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>
        vnoremap crm <Esc><Cmd>lua require('jdtls').extract_method(true)<CR>
    ]]

    -- setup dap
    jdtls.setup_dap({ hotcodereplace = 'auto', config_overrides = {} })
end

-- create bundles table
local get_bundles = function()
    -- java-debug-adapter loc
    local JAVA_DEBUG_ADAPTER_LOC = get_package_install_path('java-debug-adapter') .. "/extension/server"

    -- java-test loc
    local VSCODE_JAVA_TEST_LOC = get_package_install_path('java-test') .. "/extension/server"
    -- local VSCODE_JAVA_TEST_LOC = home .. '/.config/packages/vscode-java-test/server'

    -- Debugging bundles
    local bundles = {}

    vim.list_extend(bundles, vim.split(vim.fn.glob(JAVA_DEBUG_ADAPTER_LOC .. "/*.jar"), "\n"))
    vim.list_extend(bundles, vim.split(vim.fn.glob(VSCODE_JAVA_TEST_LOC .. "/*.jar"), "\n"))

    return bundles
end

-- resolve os string to determine the jdtls plugin jar launcher
local function get_os_string()
    local os
    if vim.fn.has "macunix" then
        os = "mac"
    elseif vim.fn.has "win32" then
        os = "win"
    else
        os = "linux"
    end
    return os
end

-- Here you can configure eclipse.jdt.ls specific settings
-- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
-- for a list of options
local function get_settings()
    return {
        signature_help = { enabled = true },
        java = {
            trace = { server = false },
            -- Specify any completion options
            completion = {
                favoriteStaticMembers = {
                    "org.hamcrest.MatcherAssert.assertThat",
                    "org.hamcrest.Matchers.*",
                    "org.hamcrest.CoreMatchers.*",
                    "org.junit.jupiter.api.Assertions.*",
                    "java.util.Objects.requireNonNull",
                    "java.util.Objects.requireNonNullElse",
                    "org.assertj.core.api.Assertions.*",
                    "org.mockito.Mockito.*"
                },
                filteredTypes = {
                    "com.sun.*",
                    "io.micrometer.shaded.*",
                    "java.awt.*",
                    "jdk.*", "sun.*",
                },
            },
            format = {
                settings = {
                    -- make sure to download the file from https://github.com/google/styleguide/blob/gh-pages/eclipse-java-google-style.xml
                    url = home .. "/.config/nvim/lua/plugins/lsp/files/jdtls/eclipse-java-google-style.xml",
                    profile = "GoogleStyle",
                },
            },
            signatureHelp = { enabled = true },
            contentProvider = { preferred = 'fernflower' }, -- Use fernflower to decompile library code
            -- Specify any options for organizing imports
            sources = {
                organizeImports = {
                    starThreshold = 9999,
                    staticStarThreshold = 9999,
                },
            },
            codeGeneration = {
                toString = {
                    template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
                },
                hashCodeEquals = {
                    useJava7Objects = true,
                },
                useBlocks = true,
            },
            configuration = {
                updateBuildConfiguration = "interactive",
                implementationsCodeLens = {
                    enabled = true
                },
                eclipse = {
                    downloadSources = true
                },
                maven = {
                    downloadSources = true
                },
                referencesCodeLens = {
                    enabled = true
                },
                references = {
                    includeDecompiledSources = true
                },
                format = {
                    enabled = true
                },
                runtimes = {
                    {
                        name = "JavaSE-1.8",
                        path = java_8,
                    },
                    {
                        name = "JavaSE-11",
                        path = java_11
                    },
                    {
                        name = "JavaSE-14",
                        path = java_14
                    },
                    {
                        name = "JavaSE-17",
                        path = java_17
                    },
                    {
                        name = "JavaSE-19",
                        path = java_19
                    },
                    {
                        name = "JavaSE-21",
                        default = true,
                        path = java_21
                    },
                }
            }
        }
    }
end

-- The command that starts the language server
-- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
local function get_cmd()
    return {
        java_21 .. "/bin/java",
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xmx1G',
        -- "-XX:+UseSerialGC",
        '-javaagent:' .. lombok_jar,
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
        '--add-exports', 'java.base/jdk.internal.misc=ALL-UNNAMED',
        '-jar', vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
        '-configuration', jdtls_path .. "/config_" .. get_os_string(),
        '-data', workspace_folder(),
    }
end

require('lspconfig').jdtls.setup {
    on_attach = on_attach_jdtls,
    capabilities = require 'plugins.lsp.utils.capabilities_options'.default,
    flags = {
        debounce_text_changes = 80,
    },
    filetypes = { "java" },
    cmd = get_cmd(),
    settings = get_settings(),
    root_dir = root_dir(),
    init_options = {
        bundles = get_bundles()
    }
}
