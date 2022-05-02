vim.g["sandwich#recipes"] = {
	{ buns = { "( ", " )" }, nesting = 1, match_syntax = 1, input = { "(" } },
	{ buns = { "[ ", " ]" }, nesting = 1, match_syntax = 1, input = { "[" } },
	{ buns = { "{ ", " }" }, nesting = 1, match_syntax = 1, input = { "{" } },
	{ buns = { "(", ")" }, nesting = 1, match_syntax = 1, input = { ")" } },
	{ buns = { "[", "]" }, nesting = 1, match_syntax = 1, input = { "]" } },
	{ buns = { "{", "}" }, nesting = 1, match_syntax = 1, input = { "}" } },
}
