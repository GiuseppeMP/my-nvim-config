local alpha = require("alpha")
--https://patorjk.com/software/taag/#p=display&v=0&f=ANSI%20Shadow&t=Hack%20time!%0A
local dash = require 'alpha.themes.startify'

local hacktime = [[
██╗  ██╗ █████╗  ██████╗██╗  ██╗    ████████╗██╗███╗   ███╗███████╗██╗
██║  ██║██╔══██╗██╔════╝██║ ██╔╝    ╚══██╔══╝██║████╗ ████║██╔════╝██║
███████║███████║██║     █████╔╝        ██║   ██║██╔████╔██║█████╗  ██║
██╔══██║██╔══██║██║     ██╔═██╗        ██║   ██║██║╚██╔╝██║██╔══╝  ╚═╝
██║  ██║██║  ██║╚██████╗██║  ██╗       ██║   ██║██║ ╚═╝ ██║███████╗██╗
╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝       ╚═╝   ╚═╝╚═╝     ╚═╝╚══════╝╚═╝
]]

dash.section.header.val = hacktime;

alpha.setup(dash.opts)
