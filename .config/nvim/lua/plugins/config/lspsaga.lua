local lspsaga = require("lspsaga")

lspsaga.init_lsp_saga({
	debug = false,
	use_saga_diagnostic_sign = true,
	error_sign = vim.g.config.icons.diagnostic.error,
	warn_sign = vim.g.config.icons.diagnostic.warn,
	hint_sign = vim.g.config.icons.diagnostic.hint,
	infor_sign = vim.g.config.icons.diagnostic.info,
	diagnostic_header_icon = "   ",
	code_action_icon = " ",
	code_action_prompt = {
		enable = true,
		sign = true,
		sign_priority = 40,
		virtual_text = true,
	},
	finder_definition_icon = "  ",
	finder_reference_icon = "  ",
	max_preview_lines = 10,
	finder_action_keys = {
		open = "o",
		vsplit = "s",
		split = "i",
		quit = "q",
		scroll_down = "<C-f>",
		scroll_up = "<C-b>",
	},
	code_action_keys = {
		quit = "q",
		exec = "<CR>",
	},
	rename_action_keys = {
		quit = "<C-c>",
		exec = "<CR>",
	},
	definition_preview_icon = "  ",
	border_style = "single",
	rename_prompt_prefix = "➤",
	rename_output_qflist = {
		enable = false,
		auto_open_qflist = false,
	},
	server_filetype_map = {},
	diagnostic_prefix_format = "%d. ",
	diagnostic_message_format = "%m %c",
	highlight_prefix = false,
})
