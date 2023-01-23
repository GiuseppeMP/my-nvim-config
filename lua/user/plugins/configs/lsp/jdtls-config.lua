local HOME = os.getenv "HOME"
local jdtls = require('jdtls')
local on_attach = require("user.plugins.configs.lsp.defaults_on_attach").on_attach

-- custom attach with jdtls extensions
local on_attach_jdtls = function(_client, bufnr)
    local bufopts = { noremap=true, silent=false, buffer=bufnr }
    on_attach(_client, bufnr)
    vim.keymap.set('n', 'df', ":lua require('jdtls').test_class()<CR>", bufopts)
    vim.keymap.set('n', 'dn', ":lua require('jdtls').test_nearest_method()<CR>", bufopts)
    print("jdtls-attach")
end

-- Debugger installation location
-- Its installed by mason.lua
local get_package_path = function(package_name)
    return require("mason-registry").get_package(package_name):get_install_path()
end

local JAVA_DEBUG_ADAPTER_LOC = get_package_path('java-debug-adapter').."/extension/server"
local VSCODE_JAVA_TEST_LOC = get_package_path('java-test').."/extension/server"

-- TODO may be changed to get_package_path
local get_lombok_javaagent = function()
    local lombok_jar = HOME..'/.config/nvim/coc-files/lombok-1.18.24.jar'
    return string.format('--jvm-arg=-javaagent:%s', lombok_jar)
end

local get_jdtls_cmd = function()
  local cmd = {
    -- 💀
    'jdtls',
  }

  -- add lombok agent
  local lombok_javaagent = get_lombok_javaagent()
  if (lombok_javaagent ~= '') then
    table.insert(cmd, lombok_javaagent)
  end

  return cmd
end


local get_bundles = function()

    -- Debugging bundles
    local bundles = { }
        -- vim.fn.glob(
        --     DEBUGGER_LOCATION .. "/com.microsoft.java.debug.plugin-*.jar"
        -- ),
    -- }
    -- java-debug-adapter (DAP)
    vim.list_extend(bundles, vim.split(vim.fn.glob(JAVA_DEBUG_ADAPTER_LOC .. "/*.jar"), "\n"))
    -- java-test (DAP)
    vim.list_extend(bundles, vim.split(vim.fn.glob(VSCODE_JAVA_TEST_LOC .. "/*.jar"), "\n"))

    return bundles

end

require('lspconfig')['jdtls'].setup{
    on_attach = on_attach_jdtls,
    cmd = get_jdtls_cmd(),
    init_options = {
        bundles = get_bundles()
    },
    settings = {
        java = {
            format = {
                onType = true,
                settings = {
                    profile = "GoogleStyle",
                    url = "https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml"
                }
            },
            configuration = {
                runtimes =  {
                    {
                        name= "JavaSE-11",
                        path= "~/.asdf/installs/java/corretto-11.0.16.9.1",
                        default= true
                    },
                    {
                        name= "JavaSE-14",
                        path= "~/.asdf/installs/java/zulu-14.29.23"
                    },
                    {
                        name= "JavaSE-17",
                        path= "~/.asdf/installs/java/corretto-17.0.4.9.1"
                    },
                    {
                        name= "JavaSE-1.8",
                        path= "~/.asdf/installs/java/corretto-8.342.07.1"
                    }
                }
            }
        }
    }

}

-- dap specs
jdtls.setup_dap({ hotcodereplace = 'auto' })

