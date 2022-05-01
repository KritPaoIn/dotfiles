local cmp = require("cmp")
local lspkind = require("lspkind")

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	window = {
		documentation = {
			border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
			winhighlight = "Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None",
		},
		completion = {
			border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
			winhighlight = "Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None",
		},
	},
	mapping = {
		["<Tab>"] = {
			i = function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				else
					fallback()
				end
			end,
		},
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end,
		["<C-q>"] = cmp.mapping.close(),
		["<C-f>"] = cmp.mapping.confirm({ select = true }),
	},
	sources = {
		{ name = "nvim_lsp" }, -- For nvim-lsp
		-- { name = "ultisnips" }, -- For ultisnips user
		{ name = "luasnip" }, -- For luasnip users.
		{ name = "path" }, -- For path completion
		{ name = "buffer" }, -- For buffer completion
	},
	completion = {
		keyword_length = 1,
		completeopt = "menu,noselect",
	},
	view = {
		entries = "custom",
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = lspkind.cmp_format({
			mode = "symbol",
			menu = {
				nvim_lsp = "[LSP]",
				ultisnips = "[US]",
                luasnip = "[LuaSnip]",
				nvim_lua = "[Lua]",
				path = "[Path]",
				buffer = "[Buffer]",
				emoji = "[Emoji]",
			},
			maxwidth = 50,

			symbol_map = {
				Keyword = "\u{f1de}",
				Variable = "\u{e79b}",
				Value = "\u{f89f}",
				Operator = "\u{03a8}",
				Function = "\u{0192}",
				Reference = "\u{fa46}",
				Constant = "\u{f8fe}",
				Method = "\u{f09a}",
				Struct = "\u{fb44}",
				Class = "\u{f0e8}",
				Interface = "\u{f417}",
				Text = "\u{e612}",
				Enum = "\u{f435}",
				EnumMember = "\u{f02b}",
				Module = "\u{f40d}",
				Color = "\u{e22b}",
				Property = "\u{e624}",
				Field = "\u{f9be}",
				Unit = "\u{f475}",
				Event = "\u{facd}",
				File = "\u{f723}",
				Folder = "\u{f114}",
				Snippet = "\u{e60b}",
				TypeParameter = "\u{f728}",
			},

			before = function(_, vim_item)
				return vim_item
			end,
		}),
	},
})

vim.cmd([[
highlight! CmpItemMenu guibg=NONE guifg=#808080
highlight! CmpItemMenuDefault guibg=NONE guifg=#808080
]])
