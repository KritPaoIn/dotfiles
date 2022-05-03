local theme_name = vim.g.config.theme or "ayu"

local theme = require(string.format("appearance.themes.%s", theme_name))

theme.theme()

if vim.g.config.bufferline and theme.bufferline then
    theme.bufferline()
end

if vim.g.config.statusline and theme.statusline then
    theme.statusline()
end

if vim.g.config.gitgutter and theme.gitgutter then
	theme.gitgutter()
end
