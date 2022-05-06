local previous_tag
function _G.TagInput(is_head)
	local tag
	if is_head == 1 then
		previous_tag = vim.fn.input("Tag: ")
		tag = string.format("<%s>", previous_tag)
	else
		tag = string.format("</%s>", vim.fn.matchstr(previous_tag, "^\a[^[:blank:]>/]*"))
	end
	return tag
end

function _G.FuncInput(is_head)
	local func_name
	if is_head == 1 then
		previous_tag = vim.fn.input("Function Name: ")
		func_name = string.format("%s(", func_name)
	else
		func_name = string.format(")")
	end
	return func_name
end

vim.g["sandwich#recipes"] = {
	{ buns = { "( ", " )" }, nesting = 1, match_syntax = 1, input = { "(" } },
	{ buns = { "[ ", " ]" }, nesting = 1, match_syntax = 1, input = { "[" } },
	{ buns = { "{ ", " }" }, nesting = 1, match_syntax = 1, input = { "{" } },
	{ buns = { "(", ")" }, nesting = 1, match_syntax = 1, input = { ")" } },
	{ buns = { "[", "]" }, nesting = 1, match_syntax = 1, input = { "]" } },
	{ buns = { "{", "}" }, nesting = 1, match_syntax = 1, input = { "}" } },
	{
		buns = { "v:lua.TagInput(1)", "v:lua.TagInput(0)" },
		expr = 1,
		kind = { "add", "replace" },
		action = { "add" },
		input = { "t" },
	},
	{
		buns = { "v:lua.FuncInput(1)", "v:lua.FuncInput(0)" },
		expr = 1,
		kind = { "add" },
		action = { "add" },
		input = { "f" },
	},
}
