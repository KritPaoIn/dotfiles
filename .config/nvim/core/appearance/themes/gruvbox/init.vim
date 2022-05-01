set termguicolors
set t_Co=256

packadd gruvbox
packadd barbar.nvim

nnoremap <S-H> <Cmd>BufferPrevious<CR>
nnoremap <S-L> <Cmd>BufferNext<CR>

set background=dark
colorscheme gruvbox

hi Normal ctermbg=NONE guibg=NONE
" highlight link IndentBlanklineChar
