scriptencoding utf-8

set splitbelow splitright
" Default Tab Spacing As 4
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set scrolloff=10

" set mouse=a

" Text Wrapping
set wrap

" Cursor Line
set cursorline

" Search Case Insensitively
set ignorecase smartcase

" Line Number
set number

" " Increment Searching
" set incsearch

" Faster Update Time
set updatetime=400

" Copy to Clipboard
if !empty(provider#clipboard#Executable())
    set clipboard+=unnamedplus
endif

" Reduces Lag
syntax sync minlines=256

set undofile

" set completeopt=menu,menuone,noselect
