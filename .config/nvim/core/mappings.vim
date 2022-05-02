scriptencoding utf-8

" Replaces <Leader> key
let g:mapleader = ','

" Better Cmd
nnoremap ; :
xnoremap ; :

" Better Command Window Open
nnoremap q; q:

" Resource Vimrc
nnoremap <silent> <Leader>ev :<C-U>tabnew $MYVIMRC <bar> tcd %:h<cr>
nnoremap <silent> <Leader>sv :<C-U>silent update $MYVIMRC <bar> source $MYVIMRC <bar>
      \ call v:lua.vim.notify("Nvim config successfully reloaded!", 'info', {'title': 'nvim-config'})<cr>

" Navigate Through Physical Lines
nnoremap <expr> <silent> j (v:count == 0 ? 'gj' : 'j')
nnoremap <expr> <silent> k (v:count == 0 ? 'gk' : 'k')
nnoremap ^ g^
nnoremap 0 g0

" Insert a blank line above or below without moving the cursor
nnoremap <expr> <Space>o printf('m`%so<ESC>``', v:count1)
nnoremap <expr> <Space>O printf('m`%sO<ESC>``', v:count1)

" Change text without putting it into the vim register
nnoremap c "_c
nnoremap C "_C
nnoremap cc "_cc
xnoremap c "_c

" Replace visual selection with text in register, but not contaminate the
" register, see also https://stackoverflow.com/q/10723700/6064933.
xnoremap p "_c<ESC>p

" Keep cursor position after yanking
nnoremap y myy
xnoremap y myy

" Selects around quoted words without selecting whitespaces
onoremap a' 2i'
onoremap a" 2i"
vnoremap a' 2i'
vnoremap a" 2i"

" Keep Cursor When Asterisk
nnoremap * :keepjumps normal! mi*`i<CR>

" Strips Trailing Whitespaces
nnoremap <Leader><Space> <Cmd>StripWhitespace<CR>

" Smooth Tmux Navigation
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> <Cmd>TmuxNavigateLeft<CR>
nnoremap <silent> <C-j> <Cmd>TmuxNavigateDown<CR>
nnoremap <silent> <C-k> <Cmd>TmuxNavigateUp<CR>
nnoremap <silent> <C-l> <Cmd>TmuxNavigateRight<CR>

" Unhighlight Highlighted Search
nnoremap <silent> <Esc> <Cmd>nohlsearch<CR>

" Prints out what the word under the cursor is using
nnoremap <Leader>sy <Cmd>echo synIDattr(synID(line("."), col("."), 1), "name")<CR>

" Format Entire File In Columns
nnoremap <Leader>c <Cmd>:%!column -t<CR>

nnoremap <S-CR> o<Esc>
inoremap <S-CR> <Esc>o

nnoremap <Leader>hl <Cmd>TSHighlightCapturesUnderCursor<CR>
