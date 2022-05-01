require("nvim-tree").setup({
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = false,
	ignore_ft_on_setup = {},
	open_on_tab = false,
	hijack_cursor = false,
	update_cwd = false,
	-- update_to_buf_dir = {
	-- 	enable = true,
	-- 	auto_open = true,
	-- },
	diagnostics = {
		enable = true,
		icons = {
			error = vim.g.config.icons.diagnostic.error,
			warning = vim.g.config.icons.diagnostic.warn,
			hint = vim.g.config.icons.diagnostic.hint,
			info = vim.g.config.icons.diagnostic.info,
		},
	},
	update_focused_file = {
		enable = false,
		update_cwd = false,
		ignore_list = {},
	},
	system_open = {
		cmd = nil,
		args = {},
	},
	filters = {
		dotfiles = false,
		custom = {},
	},
	git = {
		enable = false,
		ignore = true,
		timeout = 500,
	},
	view = {
		width = 30,
		height = 30,
		hide_root_folder = false,
		side = "left",
		-- auto_resize = true,
		mappings = {
			custom_only = false,
			list = {
				{ key = "s", action = "" },
				{ key = "o", action = "system_open" },
			},
		},
		number = false,
		relativenumber = false,
		signcolumn = "yes",
	},
	trash = {
		cmd = "trash",
		require_confirm = true,
	},
})

vim.g.nvim_tree_icons = {
    default = "",
	git = {
		unstaged = "✗",
		staged = "✓",
		unmerged = "",
		renamed = "➜",
		untracked = "★",
		deleted = "",
		ignored = "◌",
	},
}

vim.g.nvim_tree_special_files = {}

local nvim_dev_icons = require("nvim-web-devicons")
nvim_dev_icons.set_default_icon("", "#00A7FC")
nvim_dev_icons.set_icon({
	css = {
		icon = "",
		color = "#00A7FC",
		cterm_color = "65",
		name = "css",
	},
	md = {
		icon = "",
		color = "#00A7FC",
		cterm_color = "65",
		name = "md",
	},
	html = {
		icon = "",
		color = "#F83C00",
		cterm_color = "65",
		name = "html",
	},
	rs = {
		icon = "",
		color = "#FF6430",
		cterm_color = "65",
		name = "rs",
	},
	swift = {
		icon = "",
		color = "#FF4E09",
		cterm_color = "65",
		name = "swift",
	},
	ts = {
		icon = "ﯤ",
		color = "#008AD7",
		cterm_color = "65",
		name = "ts",
	},
	js = {
		icon = "",
		color = "#FFC800",
		cterm_color = "65",
		name = "js",
	},
	go = {
		icon = "ﳑ",
		color = "#00AFC4",
		cterm_color = "65",
		name = "go",
	},
	lua = {
		icon = "",
		color = "#00A7FC",
		cterm_color = "65",
		name = "lua",
	},
	http = {
		icon = "爵",
		color = "#FA1A27",
		cterm_color = "65",
		name = "http",
	},
	dart = {
		icon = "",
		color = "#1EB8F6",
		cterm_color = "65",
		name = "dart",
	},
	java = {
		icon = "",
		color = "#FF2825",
		cterm_color = "65",
		name = "java",
	},
	rb = {
		icon = "",
		color = "#FF2825",
		cterm_color = "65",
		name = "ruby",
	},
	php = {
		icon = "",
		color = "#0089EC",
		cterm_color = "65",
		name = "php",
	},
	json = {
		icon = "ﬥ",
		color = "#FFC800",
		cterm_color = "65",
		name = "json",
	},
	sh = {
		icon = "",
		color = "#FF6430",
		cterm_color = "65",
		name = "sh",
	},
	zsh = {
		icon = "",
		color = "#FF6430",
		cterm_color = "65",
		name = "zsh",
	},
	fish = {
		icon = "",
		color = "#FF6430",
		cterm_color = "65",
		name = "fish",
	},
	wasm = {
		icon = "",
		color = "#8445FF",
		cterm_color = "65",
		name = "wasm",
	},
	asm = {
		icon = "",
		color = "#FF622B",
		cterm_color = "65",
		name = "asm",
	},
	yaml = {
		icon = "",
		color = "#FF3D49",
		cterm_color = "65",
		name = "asm",
	},
	toml = {
		icon = "",
		color = "#00A7FC",
		cterm_color = "65",
		name = "toml",
	},
	config = {
		icon = "",
		color = "#00A7FC",
		cterm_color = "65",
		name = "config",
	},
	lock = {
		icon = "",
		color = "#FFD41E",
		cterm_color = "65",
		name = "lock",
	},
	[".gitignore"] = {
		icon = "",
		color = "#FA3800",
		cterm_color = "65",
		name = "gitignore",
	},
	[".eslintrc.json"] = {
		icon = "",
		color = "#3A50BC",
		cterm_color = "65",
		name = "eslintrc",
	},
	Dockerfile = {
		icon = "",
		color = "#0089CF",
		cterm_color = "65",
		name = "Dockerfile",
	},
	dockerfile = {
		icon = "",
		color = "#0089CF",
		cterm_color = "65",
		name = "dockerfile",
	},
	Makefile = {
		icon = "",
		color = "#FF4248",
		cterm_color = "65",
		name = "Makefile",
	},
	makefile = {
		icon = "",
		color = "#FF4248",
		cterm_color = "65",
		name = "makefile",
	},
})

vim.api.nvim_set_keymap("n", "<Space>s", "<Cmd>NvimTreeFindFileToggle<CR>", { noremap = true, silent = true })
