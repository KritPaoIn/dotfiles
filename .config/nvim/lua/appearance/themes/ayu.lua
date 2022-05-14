local opt = vim.opt

local m = {}

local extra_highlights = [[
highlight! link BufferCurrent Normal
highlight! link BufferCurrentTarget Normal
highlight! link BufferCurrentSign Normal
highlight! BufferVisible guifg=Gray guibg=NONE
highlight! link BufferVisibleTarget BufferVisible
exec 'hi BufferVisibleSign guibg=NONE ' . 'guifg=' . synIDattr(hlID('Normal'),'bg')
highlight! link BufferCurrentMod BufferCurrent
highlight! link BufferInactiveMod BufferInactive
highlight! link BufferVisibleMod BufferVisible
highlight! link SignColumn LineNr
highlight! link LspSagaDiagnosticBorder Normal
highlight! link LspSagaCodeActionBorder Normal
highlight! link LspSagaFloatWinBorder Normal
highlight! link LspSagaRenameBorder Normal
highlight! link LspSagaSignatureHelpBorder Normal
highlight! link LspSagaDiagBorder Normal
highlight! link LspSagaDefPreviewBorder Normal
highlight! link LspSagaDiagnosticTruncateLine Normal
highlight! link LspSagaCodeActionTruncateLine Normal
highlight! link LspSagaFloatWinTruncateLine Normal
highlight! link LspSagaRenameTruncateLine Normal
highlight! link LspSagaSignatureHelpTruncateLine Normal
highlight! link LspSagaDiagTruncateLine Normal
highlight! link LspSagaDefPreviewTruncateLine Normal
" highlight DiagnosticError guifg=#E51300
" highlight DiagnosticWarn guifg=#A58A00
" highlight DiagnosticInfo guifg=#007BD3
" highlight DiagnosticHint guifg=#007BD3
highlight Normal ctermbg=NONE guibg=NONE
highlight! link NvimTreeFolderName Normal
highlight! link NvimTreeOpenedFolderName Normal
highlight! link TSParameter TSConstant
exec 'hi EndOfBuffer guibg=NONE ' . 'guifg=' . synIDattr(hlID('SignColumn'),'bg')
highlight! link TSInclude TSKeyword
highlight GitGutterAdd    guifg=#4d7e00 ctermfg=2
highlight GitGutterChange guifg=#007fa1 ctermfg=3
highlight GitGutterDelete guifg=#a20011 ctermfg=1
]]

function m.theme()
	opt.termguicolors = true
	vim.cmd("packadd ayu-vim")
	vim.g.Hexokinase_highlighters = { "backgroundfull" }

	local auto_dark_mode = require("auto-dark-mode")
	auto_dark_mode.setup({
		update_interval = 1000,
		set_dark_mode = function()
			vim.g.ayucolor = "dark"
			vim.cmd("colorscheme ayu")
			vim.cmd([[
                highlight! link BufferCurrent Normal
                highlight! link BufferCurrentTarget Normal
                highlight! link BufferCurrentSign Normal
                highlight! BufferVisible guifg=Gray guibg=NONE
                highlight! link BufferVisibleTarget BufferVisible
                exec 'hi BufferVisibleSign guibg=NONE ' . 'guifg=' . synIDattr(hlID('Normal'),'bg')
                highlight! link BufferCurrentMod BufferCurrent
                highlight! link BufferInactiveMod BufferInactive
                highlight! link BufferVisibleMod BufferVisible
                highlight! link SignColumn LineNr
                highlight! link LspSagaDiagnosticBorder Normal
                highlight! link LspSagaCodeActionBorder Normal
                highlight! link LspSagaFloatWinBorder Normal
                highlight! link LspSagaRenameBorder Normal
                highlight! link LspSagaSignatureHelpBorder Normal
                highlight! link LspSagaDiagBorder Normal
                highlight! link LspSagaDefPreviewBorder Normal
                highlight! link LspSagaDiagnosticTruncateLine Normal
                highlight! link LspSagaCodeActionTruncateLine Normal
                highlight! link LspSagaFloatWinTruncateLine Normal
                highlight! link LspSagaRenameTruncateLine Normal
                highlight! link LspSagaSignatureHelpTruncateLine Normal
                highlight! link LspSagaDiagTruncateLine Normal
                highlight! link LspSagaDefPreviewTruncateLine Normal
                highlight Normal ctermbg=NONE guibg=NONE
                highlight! link NvimTreeFolderName Normal
                highlight! link NvimTreeOpenedFolderName Normal
                highlight! link TSParameter TSConstant
                exec 'hi EndOfBuffer guibg=NONE ' . 'guifg=' . synIDattr(hlID('SignColumn'),'bg')
                highlight! link TSInclude TSKeyword

                highlight GitGutterAdd    guifg=#4d7e00 ctermfg=2
                highlight GitGutterChange guifg=#007fa1 ctermfg=3
                highlight GitGutterDelete guifg=#a20011 ctermfg=1

                highlight Pmenu guifg=NONE guibg=NONE
                highlight link FloatBorder NonText
            ]])
		end,
		set_light_mode = function()
			vim.g.ayucolor = "light"
			vim.cmd("colorscheme ayu")
			vim.cmd(extra_highlights)
		end,
	})
	auto_dark_mode.init()
end

function m.bufferline()
	vim.cmd("packadd barbar.nvim")
	vim.g.bufferline.icon_separator_active = "▌"
	vim.g.bufferline.icon_separator_inactive = ""
	vim.g.bufferline.closable = true
	vim.keymap.set("n", "<S-H>", "<Cmd>BufferPrevious<CR>")
	vim.keymap.set("n", "<S-L>", "<Cmd>BufferNext<CR>")
	vim.keymap.set("n", "<C-c>", "<Cmd>BufferClose<CR>")
end

function m.statusline()
	vim.cmd("packadd lualine.nvim")
	require("lualine").setup({
		options = {
			icons_enabled = true,
			theme = "ayu",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = {},
			always_divide_middle = true,
			globalstatus = false,
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = { "filename" },
			lualine_x = { "encoding", "fileformat", "filetype" },
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		extensions = {},
	})
end

function m.gitgutter()
	vim.g.gitgutter_sign_added = vim.g.config.icons.gitgutter.added
	vim.g.gitgutter_sign_modified = vim.g.config.icons.gitgutter.modified
	vim.g.gitgutter_sign_removed = vim.g.config.icons.gitgutter.removed
	vim.g.gitgutter_sign_removed_first_line = vim.g.config.icons.gitgutter.removed
	vim.g.gitgutter_sign_removed_above_and_below = vim.g.config.icons.gitgutter.removed
	vim.g.gitgutter_sign_modified_removed = vim.g.config.icons.gitgutter.modified
end

return m
