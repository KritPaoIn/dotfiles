set termguicolors
set t_Co=256

packadd gruvbox-material
packadd barbar.nvim

nnoremap <S-H> <Cmd>BufferPrevious<CR>
nnoremap <S-L> <Cmd>BufferNext<CR>

set background=dark
let g:gruvbox_material_background = 'soft'
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_transparent_background = 1
let g:gruvbox_material_disable_italic_comment = 1
colorscheme gruvbox-material
