set termguicolors
set t_Co=256

packadd lualine.nvim
packadd barbar.nvim

lua << EOF
local function location()
	local lineCol = vim.api.nvim_win_get_cursor(0)
	local line, column = unpack(lineCol)
	return string.format("Ln %s, Col %s", line, column)
end

local function tabSpaces()
	local spaces = vim.o.tabstop
	return string.format("Spaces: %d", spaces)
end

local theme = {}
local sections = { "a", "b", "c" }
local function setThemeColor(conf)
	local mode = conf.mode
	local color = conf.color
	for key, col in pairs(color) do
		for _, m in ipairs(mode) do
			for _, section in ipairs(sections) do
				theme[m] = theme[m] or {}
				theme[m][section] = theme[m][section] or {}
				theme[m][section][key] = col
			end
		end
	end
end

setThemeColor({ mode = { "normal" }, color = { fg = "#FFFFFF", bg = "#007ACC" } })
setThemeColor({ mode = { "visual" }, color = { fg = "#FFFFFF", bg = "#71167E" } })
setThemeColor({ mode = { "command", "replace", "insert" }, color = { fg = "#FFFFFF", bg = "#FFAF00" } })
setThemeColor({ mode = { "inactive" }, color = { fg = "#FFFFFF", bg = "#252526" } })

-- setThemeColor({ mode = { "normal", "visual", "command", "replace", "insert", "inactive" }, color = { fg = "#CCCCCC", bg = "#373737" } })

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = theme,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {},
		always_divide_middle = true,
		globalstatus = false,
	},
	sections = {
		lualine_a = {
			{ "branch", icon = "" },
		},
		lualine_b = {
			{
				"diagnostics",
				sources = { "nvim_diagnostic", "coc" },
				sections = { "error", "warn" },
				symbols = {
					error = vim.g.config.icons.diagnostic.error .. " ",
					warn = vim.g.config.icons.diagnostic.warn .. " ",
				},
				colored = false,
				update_in_insert = false,
				always_visible = true,
			},
			-- {
			-- 	"mode",
			-- 	fmt = function(str)
			-- 		return string.format("--%s--", str)
			-- 	end,
			-- },
			"filename",
		},
		lualine_c = {},
		lualine_x = { location, tabSpaces, "encoding" },
		lualine_y = { { "filetype", colored = false } },
		lualine_z = {},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { location },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
EOF

packadd vscode.nvim
let g:vscode_transparent = 1
let g:vscode_disable_nvimtree_bg = v:true

function! ChangeBackground()
  if system("defaults read -g AppleInterfaceStyle") =~ '^Dark'
    let g:vscode_style = "dark"
  else
    let g:vscode_style = "light"
  endif
  colorscheme vscode
endfunction

call ChangeBackground()

nnoremap <S-H> <Cmd>BufferPrevious<CR>
nnoremap <S-L> <Cmd>BufferNext<CR>
nnoremap <C-c> <Cmd>BufferClose<CR>

highlight! link BufferVisible BufferCurrent
highlight! link BufferVisibleTarget BufferCurrent
highlight! link BufferVisibleSign BufferCurrent

highlight! link BufferCurrentMod BufferCurrent
highlight! link BufferInactiveMod BufferInactive
highlight! link BufferVisibleMod BufferVisible

highlight GitGutterAdd    guifg=#4d7e00 ctermfg=2
highlight GitGutterChange guifg=#007fa1 ctermfg=3
highlight GitGutterDelete guifg=#a20011 ctermfg=1

highlight DiagnosticError guifg=#E51300
highlight DiagnosticWarn guifg=#A58A00
highlight DiagnosticInfo guifg=#007BD3
highlight DiagnosticHint guifg=#007BD3

highlight! link EndOfBuffer LineNr
