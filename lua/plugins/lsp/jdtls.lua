local jdtls = require 'jdtls'
local jdtls_tests = require 'jdtls.tests'
local on_attach_options = require("plugins.lsp.utils.on_attach_options")
require("mason")

-- mason utils to get installation path
local get_package_install_path = function(package_name)
    return vim.fn.expand("$MASON/packages/" .. package_name)
end
-- print("mason package path: " .. path)
-- return path
-- mason installations registry
-- local mason_registry = require("mason-registry");
-- return mason_registry.get_package(package_name):get_install_path()

-- home dir
local home = os.getenv "HOME"
-- local java_8 = os.getenv "JAVA_8"
-- local java_11 = os.getenv "JAVA_11"
-- local java_14 = os.getenv "JAVA_14"
-- local java_17 = os.getenv "JAVA_17"
-- local java_19 = os.getenv "JAVA_19"
local java_21 = os.getenv "JAVA_21"
-- local java_21_jdtls = home .. "/.asdf/installs/java/corretto-21.0.6.7.1"

-- maybe needs to improve marks because multimodule projects (maven/gradle)
local root_markers = { 'pom.xml', 'gradlew', 'mvnw', '.git', 'settings.gradle', '.lsp_root' }

-- root dir, workspace and project name
-- local root_dir = function() return require('jdtls.setup').find_root(root_markers) end
local root_dir = function() return vim.fs.root(0 , root_markers) end

-- project name is assumed by the folder name
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

-- eclipse needs to create workspace settings folder, you can reset it using :JdtWipeDataAndRestart
local workspace_folder = function()
    local workspace = home .. "/.local/share/nvim/jdtls_workspaces/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
    -- print(workspace)
    return workspace
    -- return vim.fn.stdpath "data" .. "/jdtls/workspace_root/" .. project_name
end


-- lombok jar path
local lombok_jar = vim.fn.glob(home .. '/.config/nvim/lua/plugins/lsp/files/jdtls/lombok-*.jar')
-- local lombok_jar = home .. "/Downloads/lombok.jar"
-- print(lombok_jar)

-- jdtls path
local jdtls_path = get_package_install_path('jdtls')
-- print(jdtls_path)

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
    _client.server_capabilities.semanticTokensProvider = nil

    if vim.api.nvim_get_option_value('bufhidden', { buf = buf_nr }) == 'wipe' then
        return
    end

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
    require('jdtls.dap').setup_dap_main_class_configs({ verbose = false })
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
    -- print(os)
    return os
end

-- Here you can configure eclipse.jdt.ls specific settings
-- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
-- for a list of options
local function get_settings()
    return {
        signature_help = { enabled = true },
        java = {
            trace = { server = true },
            -- Specify any completion options
            completion = {
                favoriteStaticMembers = {
                    "org.awaitility.Awaitility.*",
                    "org.hamcrest.MatcherAssert.*",
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
                    -- url = home .. "/.config/nvim/lua/plugins/lsp/files/jdtls/eclipse-java-google-style.xml",
                    url = home .. "/.config/nvim/lua/plugins/lsp/files/jdtls/intellij-google-style.xml",
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
                    -- {
                    --     name = "JavaSE-1.8",
                    --     path = java_8,
                    -- },
                    -- {
                    --     name = "JavaSE-11",
                    --     path = java_11
                    -- },
                    -- {
                    --     name = "JavaSE-14",
                    --     path = java_14
                    -- },
                    -- {
                    --     name = "JavaSE-17",
                    --     path = java_17
                    -- },
                    -- {
                    --     name = "JavaSE-19",
                    --     path = java_19
                    -- },
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
local function getEclipseLauncherJar()
    local eclipse_plugins = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
    -- print(eclipse_plugins)
    return eclipse_plugins
end
local function getConfigurationPath()
    local config_path = jdtls_path .. "/config_" .. get_os_string()
    -- print(config_path)
    return config_path
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
        '-noverify',
        '-XX:TieredStopAtLevel=1',
        '-Dlog.level=ALL',
        '-Xmx1G',
        -- "-XX:+UseSerialGC",
        '-javaagent:' .. lombok_jar,
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
        '--add-exports', 'java.base/jdk.internal.misc=ALL-UNNAMED',
        '-jar', getEclipseLauncherJar(),
        '-configuration', getConfigurationPath(),
        '-data', workspace_folder(),
    }
end

local jdtls_config = {
    name = "jdtls",
    on_attach = on_attach_jdtls,
    capabilities = require('plugins.lsp.utils.capabilities_options').default,
    flags = {
        debounce_text_changes = 80,
    },
    cmd = get_cmd(),
    settings = get_settings(),
    root_dir = root_dir(),
    init_options = {
        bundles = get_bundles()
    }
}
-- Not working as expected
-- require('lspconfig').jdtls.setup(jdtls_config)
-- vim.lsp.config('jdtls', jdtls_config)

local function jdtls_start_or_attach()
    jdtls.start_or_attach(jdtls_config)
end

vim.api.nvim_exec([[
  augroup JDTLSAutocmd
    autocmd!
    autocmd BufRead,BufNewFile *.class lua jdtls_start_or_attach()
  augroup END
]], false)

vim.api.nvim_create_autocmd("Filetype", {
    pattern = "java",
    callback = jdtls_start_or_attach
})
-- vim.api.nvim_create_autocmd("Filetype", {
--     pattern = "groovy",
--     callback = jdtls_start_or_attach
-- })

vim.lsp.enable("jdtls")
