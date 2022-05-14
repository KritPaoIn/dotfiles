local Rule = require("nvim-autopairs.rule")
-- local ts_conds = require("nvim-autopairs.ts-conds")
-- local cond = require("nvim-autopairs.conds")
local npairs = require("nvim-autopairs")

npairs.setup({
	map_cr = true,
	map_bs = true,
	check_ts = true,
	enable_check_bracket_line = false,
	ts_config = {},
})

npairs.add_rules({
	Rule("struct%s[a-zA-Z0-9]+%s?%{$", "};", "cpp"):use_regex(true, "{"),
	Rule("class%s[a-zA-Z0-9]+%s?%{$", "};", "cpp"):use_regex(true, "{"),
	Rule("#include%s?<$", ">", "cpp"):use_regex(true, "<"),
	Rule(" ", " "):with_pair(function(opts)
		local pair = opts.line:sub(opts.col - 1, opts.col)
		return vim.tbl_contains({ "()", "[]", "{}", "  " }, pair)
	end),
	Rule("( ", " )")
		:with_pair(function()
			return false
		end)
		:with_move(function(opts)
			return opts.prev_char:match(".%)") ~= nil
		end)
		:use_key(")"),
	Rule("{ ", " }")
		:with_pair(function()
			return false
		end)
		:with_move(function(opts)
			return opts.prev_char:match(".%}") ~= nil
		end)
		:use_key("}"),
	Rule("[ ", " ]")
		:with_pair(function()
			return false
		end)
		:with_move(function(opts)
			return opts.prev_char:match(".%]") ~= nil
		end)
		:use_key("]"),
})
