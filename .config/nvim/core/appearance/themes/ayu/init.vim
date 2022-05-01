set termguicolors
set t_Co=256

let g:Hexokinase_highlighters = ['backgroundfull']

packadd barbar.nvim
packadd lualine.nvim

let bufferline.icon_separator_active = '▌'
let bufferline.icon_separator_inactive = ''
let bufferline.closable = v:true

lua << EOF
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
EOF

packadd ayu-vim

colorscheme ayu

" function! ChangeBackground()
  " if system("defaults read -g AppleInterfaceStyle") =~ '^Dark'
  "   let g:ayucolor = "dark"
  " else
  "   let g:ayucolor = "light"
  " endif
" endfunction

" call ChangeBackground()

nnoremap <S-H> <Cmd>BufferPrevious<CR>
nnoremap <S-L> <Cmd>BufferNext<CR>
nnoremap <C-c> <Cmd>BufferClose<CR>

highlight! link BufferCurrent Normal
highlight! link BufferCurrentTarget Normal
highlight! link BufferCurrentSign Normal

highlight! BufferVisible guifg=Gray guibg=NONE
highlight! link BufferVisibleTarget BufferVisible
" highlight! link BufferVisibleSign guibg=NONE guifg=
exec 'hi BufferVisibleSign guibg=NONE ' . 'guifg=' . synIDattr(hlID('Normal'),'bg')

highlight! link BufferCurrentMod BufferCurrent
highlight! link BufferInactiveMod BufferInactive
highlight! link BufferVisibleMod BufferVisible

highlight GitGutterAdd    guifg=#4d7e00 ctermfg=2
highlight GitGutterChange guifg=#007fa1 ctermfg=3
highlight GitGutterDelete guifg=#a20011 ctermfg=1

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
highlight link NvimTreeFolderName Normal
highlight link NvimTreeOpenedFolderName Normal

exec 'hi EndOfBuffer guibg=NONE ' . 'guifg=' . synIDattr(hlID('SignColumn'),'bg')
