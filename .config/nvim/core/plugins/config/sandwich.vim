" Prevent Key Conflict
nmap s <Nop>
omap s <Nop>

function! TagInput(is_head) abort
  if a:is_head
    let s:TagLast = input('Tag: ')
    let tag = printf('<%s>', s:TagLast)
  else
    let tag = printf('</%s>', matchstr(s:TagLast, '^\a[^[:blank:]>/]*'))
  endif
  return tag
endfunction

function! FuncInput(is_head) abort
  if a:is_head
    let s:FuncName = input('Function: ')
    if s:FuncName !=# ''
      let tag = printf('%s(', s:FuncName)
    else
      throw 'OperatorSandwichCancel'
    endif
  else
    let tag = printf(')')
  endif
  return tag
endfunction

let g:sandwich#recipes = []

let g:sandwich#recipes += [
	\ {'buns': ['( ', ' )'], 'nesting': 1, 'match_syntax': 1, 'input': ['('] },
	\ {'buns': ['[ ', ' ]'], 'nesting': 1, 'match_syntax': 1, 'input': ['['] },
	\ {'buns': ['{ ', ' }'], 'nesting': 1, 'match_syntax': 1, 'input': ['{'] },
	\ {'buns': ['(', ')'], 'nesting': 1, 'match_syntax': 1, 'input': [')'] },
	\ {'buns': ['[', ']'], 'nesting': 1, 'match_syntax': 1, 'input': [']'] },
	\ {'buns': ['{', '}'], 'nesting': 1, 'match_syntax': 1, 'input': ['}'] },
	\ ]

let g:sandwich#recipes += [
      \   {
      \     'buns'    : ['TagInput(1)', 'TagInput(0)'],
      \     'expr'    : 1,
      \     'filetype': ['html', 'js', 'ts', 'javascriptreact', 'typescriptreact', 'md'],
      \     'kind'    : ['add', 'replace'],
      \     'action'  : ['add'],
      \     'input'   : ['t'],
      \   },
      \ ]

let g:sandwich#recipes += [
      \   {
      \     'buns'    : ['FuncInput(1)', 'FuncInput(0)'],
      \     'expr'    : 1,
      \     'kind'    : ['add', 'replace'],
      \     'action'  : ['add'],
      \     'input'   : ['f'],
      \   },
      \ ]
