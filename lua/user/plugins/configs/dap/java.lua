-- nvim dap - java configs
local dap = require("dap")

-- java
dap.configurations.java = {
  {
    type = 'java';
    request = 'launch';
    name = "Debug (Attach) - Remote";
    hostName = "127.0.0.1";
    port = 5005;
  },
}
