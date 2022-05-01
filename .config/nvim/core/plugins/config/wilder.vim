" call timer_start(250, { -> s:wilder_init() })

" function! s:wilder_init() abort
"   try
"     call wilder#setup({
"           \ 'modes': [':', '/', '?'],
"           \ 'next_key' : '<Tab>',
"           \ 'previous_key': '<S-Tab>'
"           \ })

"     call wilder#set_option('pipeline', [
"           \   wilder#branch(
"           \     wilder#cmdline_pipeline({
"           \       'language': 'python',
"           \       'fuzzy': 1,
"           \       'sorter': wilder#python_difflib_sorter(),
"           \       'debounce': 30,
"           \     }),
"           \     wilder#python_search_pipeline({
"           \       'pattern': wilder#python_fuzzy_pattern(),
"           \       'sorter': wilder#python_difflib_sorter(),
"           \       'engine': 're',
"           \       'debounce': 30,
"           \     }),
"           \   ),
"           \ ])

"     " let l:hl = wilder#make_hl('WilderAccent', 'Pmenu', [{}, {}, {'foreground': '#66adde'}])

"     " let s:highlighters = [
"     "   \ wilder#pcre2_highlighter(),
"     "   \ has('nvim') ? wilder#lua_fzy_highlighter() : wilder#cpsm_highlighter(),
"     "   \ ]

"     " let s:popupmenu_renderer = wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
"     "   \ 'highlights': {
"     "   \   'border': 'Normal',
"     "   \   'accent': l:hl
"     "   \ },
"     "   \ 'highlighter': wilder#basic_highlighter(),
"     "   \ 'border': 'rounded',
"     "   \ 'left': [
"     "   \   ' ',
"     "   \   wilder#popupmenu_devicons(),
"     "   \   wilder#popupmenu_buffer_flags({
"     "   \     'flags': ' a + ',
"     "   \     'icons': {'+': '', 'a': '', 'h': ''},
"     "   \   }),
"     "   \ ],
"     "   \ 'right': [
"     "   \   ' ',
"     "   \   wilder#popupmenu_scrollbar(),
"     "   \ ],
"     "   \ }))

"     " let s:wildmenu_renderer = wilder#wildmenu_renderer({
"     "   \ 'highlighter': wilder#basic_highlighter(),
"     "   \ 'separator': ' · ',
"     "   \ 'left': [' ', wilder#wildmenu_spinner(), ' '],
"     "   \ 'right': [' ', wilder#wildmenu_index()],
"     "   \ })

"     " call wilder#set_option('renderer', wilder#renderer_mux({
"     "   \ ':': s:popupmenu_renderer,
"     "   \ '/': s:wildmenu_renderer,
"     "   \ 'substitute': s:wildmenu_renderer,
"     "   \ }))
"     call wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_palette_theme({
"           \ 'border': 'rounded',
"           \ 'max_height': '60%',
"           \ 'min_height': '60%',
"           \ 'max_width': '60%',
"           \ 'min_width': '60%',
"           \ 'prompt_position': 'top',
"           \ 'reverse': 0,
"           \ })))

"   catch /^Vim\%((\a\+)\)\=:E117/
"     echohl Error | echomsg "Wilder.nvim missing: run :PackerSync to fix." | echohl None
"   endtry
" endfunction
