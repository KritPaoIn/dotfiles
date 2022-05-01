local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {}
-- Set menu
dashboard.section.buttons.val = {
    dashboard.button( "e", "  > New file" , ":enew <CR>"),
    dashboard.button( "q", "  > Quit", ":qa<CR>"),
}

-- Send config to alpha
alpha.setup(dashboard.opts)
