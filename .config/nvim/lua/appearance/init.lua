local theme_name = vim.g.config.theme or "ayu"

local succ, theme = pcall(require, string.format("appearance.themes.%s", theme_name))

if not succ then
	theme = require("appearance.themes.basic")
end

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
