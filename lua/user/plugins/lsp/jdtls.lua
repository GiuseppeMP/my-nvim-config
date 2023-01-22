local on_attach = require("user.plugins.lsp.defaults").on_attach

local HOME = os.getenv "HOME"

-- Debugger installation location
local get_package_path = function(package_name)
    return require("mason-registry").get_package(package_name):get_install_path()
end

local JAVA_DEBUG_ADAPTER_LOC = get_package_path('java-debug-adapter').."/extension/server"
local VSCODE_JAVA_TEST_LOC = get_package_path('java-test').."/extension/server"

local get_lombok_javaagent = function()
    local lombok_jar = HOME..'/.config/nvim/coc-files/lombok-1.18.24.jar'
    return string.format('--jvm-arg=-javaagent:%s', lombok_jar)
end


local get_jdtls_cmd = function()
  local cmd = {
    -- 💀
    'jdtls',
  }

  local lombok_javaagent = get_lombok_javaagent()
  if (lombok_javaagent ~= '') then
    table.insert(cmd, lombok_javaagent)
  end

  return cmd
end


local get_bundles = function()

-- Debugging
    local bundles = { }
        -- vim.fn.glob(
        --     DEBUGGER_LOCATION .. "/com.microsoft.java.debug.plugin-*.jar"
        -- ),
    -- }
    -- java-debug-adapter
    vim.list_extend(bundles, vim.split(vim.fn.glob(JAVA_DEBUG_ADAPTER_LOC .. "/*.jar"), "\n"))
    -- java-test
    vim.list_extend(bundles, vim.split(vim.fn.glob(VSCODE_JAVA_TEST_LOC .. "/*.jar"), "\n"))

    return bundles

end


require('lspconfig')['jdtls'].setup{
    on_attach = on_attach,
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

local dap = require('dap')
dap.configurations.java = {
  {
    type = 'java';
    request = 'attach';
    name = "Debug (Attach) - Remote";
    hostName = "127.0.0.1";
    port = 5005;
  },
}
