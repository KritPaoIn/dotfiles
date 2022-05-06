require("nvim-treesitter.configs").setup({
    endwise = {
        enable = true,
    },
	ensure_installed = {
		"python",
		"lua",
		"vim",
		"json",
        "query",
		"javascript",
		"typescript",
		"tsx",
		"html",
        "http",
        "regex",
        "markdown",
		"css",
		"scss",
		"c",
		"cpp",
        "make",
		"cmake",
        "swift",
        "svelte",
		"rust",
		"c_sharp",
        "bash",
        "dart",
		"fish",
		"yaml",
		"toml",
	},
	ignore_install = {}, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = {}, -- list of language that will be disabled
	},
	indent = {
		enable = true,
	},
})
