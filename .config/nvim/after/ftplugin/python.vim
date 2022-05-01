" Disable inserting comment leader after hitting o or O or <Enter>
set formatoptions-=o
set formatoptions-=r

set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " expand tab to spaces so that tabs are spaces

nnoremap <silent> <buffer> <F7> :call <SID>compile_run_python()<CR>

function! s:compile_run_python() abort
  let src_path = expand('%:p:~')
  let src_noext = expand('%:p:~:r')

  if executable('python3')
    let prog = 'python3'
  elseif executable('python')
    let prog = 'python'
  else
    echoerr 'No python found on the system!'
  endif
  " call s:create_term_buf('h', 20)
  execute printf('AsyncRun %s %s %s', prog, src_path, src_noext)
endfunction

function s:create_term_buf(_type, size) abort
  set splitbelow
  set splitright
  if a:_type ==# 'v'
    vnew
  else
    new
  endif
  set nonumber
  execute 'resize ' . string(&lines * a:size / 100)
endfunction
