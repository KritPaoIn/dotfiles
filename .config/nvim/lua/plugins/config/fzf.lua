vim.g.fzf_action = {
	["ctrl-t"] = "tab split",
	["ctrl-x"] = "split",
	["ctrl-v"] = "vsplit",
}

vim.g.fzf_layout = {
	window = {
		width = 0.9,
		height = 0.6,
	},
}

vim.g.fzf_colors = {
	fg = { "fg", "Normal" },
	bg = { "bg", "Normal" },
	hl = { "fg", "Comment" },
	["hl+"] = { "fg", "Statement" },
	["fg+"] = { "fg", "CursorLine" },
	["bg+"] = { "bg", "CursorLine" },
	info = { "fg", "Comment" },
	border = { "fg", "Ignore" },
	prompt = { "fg", "Type" },
	pointer = { "fg", "Exception" },
	marker = { "fg", "Keyword" },
	spinner = { "fg", "Label" },
	header = { "fg", "Comment" },
}

vim.cmd([[
let $FZF_DEFAULT_OPTS='--reverse'
]])

vim.g.fzf_history_dir = "~/.local/share/fzf-history"

vim.keymap.set("n", "<C-p>", "<Cmd>FZF<CR>")
vim.keymap.set("n", "<C-g>", "<Cmd>Rg<CR>")
