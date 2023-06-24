local home = os.getenv("HOME")

local mason_packages = home .. "/.local/share/nvim/mason/packages/"
local get_package_path = function(package_name)

    return mason_packages .. package_name

end

local DEBUGPY_LOC = get_package_path('debugpy') .. "/venv/bin/python"

require('dap-python').setup(DEBUGPY_LOC)
