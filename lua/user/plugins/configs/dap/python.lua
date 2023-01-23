local get_package_path = function(package_name)
    return require("mason-registry").get_package(package_name):get_install_path()
end

local DEBUGPY_LOC = get_package_path('debugpy').."/venv/bin/python"

require('dap-python').setup(DEBUGPY_LOC)

