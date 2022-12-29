local on_attach = require("user.plugins.lsp.defaults").on_attach

local get_lombok_javaagent = function()
    local lombok_jar = os.getenv('HOME')..'/.config/nvim/coc-files/lombok-1.18.24.jar'
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


require('lspconfig')['jdtls'].setup{
    on_attach = on_attach,
    cmd = get_jdtls_cmd(),
    settings = {
        java = {
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
