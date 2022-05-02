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
    Rule("struct%s[a-zA-Z]+%s%{", "};", "cpp")
        :with_pair(function()
            return false
        end)
        :use_regex(true),
	Rule(" ", " "):with_pair(function(opts)
		local pair = opts.line:sub(opts.col - 1, opts.col)
		return vim.tbl_contains({ "()", "[]", "{}"}, pair)
	end),
})
