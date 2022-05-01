scriptencoding utf-8

let s:theme = g:config.theme

execute printf(
  \ 'source %s/core/appearance/themes/%s/init.vim',
  \ stdpath('config'),
  \ s:theme
  \ )
