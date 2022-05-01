scriptencoding utf-8

lua require('lua_init')

let s:plugin_configs = [
  \ 'sandwich',
  \ 'neoformat',
  \ 'openbrowser',
  \ 'fzf',
  \ 'gitgutter',
  \ 'asyncrun',
  \ 'http',
  \ 'commentary',
  \ 'leetcode',
  \ ]

for s:config in s:plugin_configs
  execute printf(
    \ 'source %s/core/plugins/config/%s.vim',
    \ stdpath('config'),
    \ s:config
    \ )
endfor
