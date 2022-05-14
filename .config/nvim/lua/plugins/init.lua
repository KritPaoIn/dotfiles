local utils = require("utils")

vim.g.package_home = vim.fn.stdpath("data") .. "/site/pack/packer"
local install_path = vim.g.package_home .. "/opt/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	local packer_repo = "https://github.com/wbthomason/packer.nvim"
	local install_cmd = string.format("10split | term git clone --depth=1 %s %s", packer_repo, install_path)
	vim.cmd(install_cmd)
end

vim.cmd("packadd packer.nvim")

local util = require("packer.util")
require("packer").startup({
	function(use)
		-- Caches Plugins
		use({ "lewis6991/impatient.nvim" })

		-- Plugin Manager
		use({ "wbthomason/packer.nvim", opt = true })

		-- Better and Faster filetype.vim
		use({ "nathom/filetype.nvim" })

		-- Logs Startup time
		use({ "tweekmonster/startuptime.vim" })

		-- LSP
		use({ "onsails/lspkind-nvim", event = "VimEnter" })

		-- Snippets
		-- use({ "SirVer/ultisnips", event = "VimEnter" })
		use({ "L3MON4D3/LuaSnip", event = "VimEnter" })

		-- Autocomplete
		use({ "hrsh7th/nvim-cmp", after = "lspkind-nvim", config = [[require("plugins.config.nvim-cmp")]] })
		use({ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" })
		-- use({ "quangnguyen30192/cmp-nvim-ultisnips", after = { "nvim-cmp", "ultisnips" } })
		use({ "saadparwaiz1/cmp_luasnip", after = { "nvim-cmp", "LuaSnip" } })
		use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
		use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })

        use({ "OmniSharp/omnisharp-vim" })

		-- LSP Configuration
		use({
			"ms-jpq/coq_nvim",
			branch = "coq",
		})
		use({
			"ms-jpq/coq.artifacts",
			after = "nvim-lspconfig",
			branch = "artifacts",
		})
		use({
			"neovim/nvim-lspconfig",
			after = "cmp-nvim-lsp",
			requires = { "coq_nvim", "cmp_nvim_lsp" },
			config = [[require("plugins.config.lsp")]],
		})

		-- Improved LSP UI
		use({ "tami5/lspsaga.nvim", event = "VimEnter", config = [[require("lspsaga")]] })

		-- Display All Linted Messages From All Buffers
		use({ "folke/trouble.nvim", event = "VimEnter", config = [[require("plugins.config.trouble")]] })

		-- Discord Rich Presence
		use({ "andweeb/presence.nvim", event = "VimEnter", config = [[require("plugins.config.presence")]] })

		-- Improved Syntax Highlighting
		use({
			"nvim-treesitter/nvim-treesitter",
			config = [[require("plugins.config.treesitter")]],
		})

		use({
			"nvim-treesitter/playground",
			after = "nvim-treesitter",
		})

		use({
			"RRethy/nvim-treesitter-endwise",
			after = { "nvim-treesitter" },
			requires = { "nvim-treesitter" },
		})

		-- use({ "tpope/vim-endwise", event = "BufEnter" })

		-- Identify Syntax Highlights

		--Debugger
		use({ "puremourning/vimspector", event = "VimEnter" })

		-- Running Shell in Vim
		use({ "skywind3000/asyncrun.vim", event = "VimEnter" })

		-- Http Requests
		use({ "nicwest/vim-http", ft = "http", config = [[require("plugins.config.http")]] })

		-- Startup Screen
		use({
			"goolord/alpha-nvim",
			event = "VimEnter",
			config = [[require('plugins.config.alpha')]],
		})

		-- File Explorer
		use({
			"kyazdani42/nvim-tree.lua",
			requires = { "kyazdani42/nvim-web-devicons" },
			config = [[require("plugins.config.nvim-tree")]],
		})

		-- Ctags Explorer
		if utils.executable("ctags") then
			use({
				"preservim/tagbar",
				config = [[require("plugins.config.tagbar")]],
			})
			-- use({ "xolox/vim-misc" })
			-- use({ "xolox/vim-easytags", requires = "vim-misc" })
		end

		-- Notification Pop-ups
		use({
			"rcarriga/nvim-notify",
			event = "BufEnter",
			config = function()
				vim.defer_fn(function()
					require("plugins.config.nvim-notify")
				end, 2000)
			end,
		})

		-- Buffer and Tab Display
		use({
			"akinsho/bufferline.nvim",
			opt = true,
		})
		use({
			"romgrk/barbar.nvim",
			opt = true,
		})

		-- Bottom StatusLine
		use({
			"nvim-lualine/lualine.nvim",
			opt = true,
		})
		use({
			"vim-airline/vim-airline",
			opt = true,
		})
		use({
			"vim-airline/vim-airline-themes",
			opt = true,
		})

		-- Command Autocomplete
		use({
			"gelguy/wilder.nvim",
			config = [[require("plugins.config.wilder")]],
		})

		-- File Fuzzy Finder
		use({ "junegunn/fzf", run = ":call fzf#install()" })
		use({ "junegunn/fzf.vim", event = "VimEnter", config = [[require("plugins.config.fzf")]] })
		use({ "airblade/vim-rooter", event = "VimEnter" })

		-- Git
		use({ "tpope/vim-fugitive", event = "VimEnter" })

		-- Smooth Scrolling
		use({
			"karb94/neoscroll.nvim",
			event = "VimEnter",
			config = [[require("plugins.config.neoscroll")]],
		})

		-- Close Parentheses Automatically
		-- use({ "LunarWatcher/auto-pairs", event = "BufEnter" })
		use({
			"windwp/nvim-autopairs",
			event = "BufEnter",
			config = [[require("plugins.config.nvim-autopairs")]],
		})

		-- use({ "luochen1990/rainbow" })

		-- use({ "Raimondi/delimitMate", event = "BufEnter" })

		if vim.g.is_win or vim.g.is_mac then
			use({
				"iamcco/markdown-preview.nvim",
				run = function()
					vim.fn["mkdp#util#install"]()
				end,
				ft = { "markdown" },
			})
		end

		-- Easy Text Surround
		use({
			"machakann/vim-sandwich",
			event = "BufEnter",
			config = [[require("plugins.config.sandwich")]],
		})

		-- Code Swapping Tool
		use({ "machakann/vim-swap", event = "BufEnter" })

		-- Easy Code Commenting
		use({ "tpope/vim-commentary", event = "BufEnter" })

		-- Yank History
		-- use({ "svermeulen/vim-yoink", event = "VimEnter" })

		-- Code Formatter
		use({
			"sbdchd/neoformat",
			cmd = "Neoformat",
			event = "VimEnter",
			config = [[require("plugins.config.neoformat")]],
		})

		-- Show and Strip Trailing Whitespaces
		-- use({ "ntpeters/vim-better-whitespace", event = "BufEnter" })

		-- Display Git Changes
		use({ "airblade/vim-gitgutter", opt = true })

		if utils.executable("tmux") then
			-- .tmux.conf Syntax Highlighting
			use({ "tmux-plugins/vim-tmux", ft = "tmux" })

			-- Seamless Vim/Tmux Navigation
			use({ "christoomey/vim-tmux-navigator" })
		end

		-- Close HTML Tags Automatically
		use({
			"alvan/vim-closetag",
			ft = {
				"html",
				"javascript",
				"typescript",
				"javascriptreact",
				"typescriptreact",
				"markdown",
			},
		})

		-- Highlight URL
		use({ "itchyny/vim-highlighturl", event = "VimEnter" })

		-- Open URL in Browser
		use({ "tyru/open-browser.vim", event = "VimEnter", config = [[require("plugins.config.openbrowser")]] })

		-- Display Hex Colors
		use({
			"RRethy/vim-hexokinase",
			run = "make hexokinase",
			ft = {
				"html",
				"css",
				"javascript",
				"typescript",
				"javascriptreact",
				"typescriptreact",
			},
		})

		-- Display Indent Lines
		use({
			"lukas-reineke/indent-blankline.nvim",
			event = "VimEnter",
			config = [[require("plugins.config.indent")]],
		})

		-- use({
		--     "ianding1/leetcode.vim",
		-- })

		-- Bad Habit Killer
		-- use({ "dusans/vim-hardmode", event = "VimEnter" })

		use({ "f-person/auto-dark-mode.nvim" })
		-- Themes
		use({ "Mofiqul/vscode.nvim", opt = true })
		use({ "sainnhe/gruvbox-material", opt = true })
		use({ "morhetz/gruvbox", opt = true })
		use({ "joshdick/onedark.vim", opt = true })
		use({ "navarasu/onedark.nvim", opt = true })
		use({ "ts-26a/vim-darkspace", opt = true })
		use({ "ayu-theme/ayu-vim", opt = true })
	end,
	config = {
		max_jobs = 32,
		compile_path = util.join_paths(vim.fn.stdpath("config"), "lua", "packer_compiled.lua"),
	},
})

local status, _ = pcall(require, "packer_compiled")
if not status then
	print("Unable to require packer_compiled.lua: run PackerSync to fix")
end
