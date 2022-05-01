set termguicolors
set t_Co=256

packadd barbar.nvim

nnoremap <S-H> <Cmd>BufferPrevious<CR>
nnoremap <S-L> <Cmd>BufferNext<CR>

if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif

packadd onedark.vim
colorscheme onedark

highlight GitGutterAdd    guifg=#4d7e00 ctermfg=2
highlight GitGutterChange guifg=#007fa1 ctermfg=3
highlight GitGutterDelete guifg=#a20011 ctermfg=1

