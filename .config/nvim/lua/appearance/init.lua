local theme_name = vim.g.config.theme or "ayu"

local theme = require(string.format("appearance.config.%s", theme_name))

theme.theme()
theme.bufferline()
theme.statusline()

