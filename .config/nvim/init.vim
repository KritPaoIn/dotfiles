let s:core_files = [
  \ 'globals.vim',
  \ 'options.vim',
  \ 'mappings.vim',
  \ 'autocommands.vim',
  \ 'plugins/init.vim',
  \ 'appearance/init.vim',
	\ ]

for s:file in s:core_files
  execute printf('source %s/core/%s', stdpath('config'), s:file)
endfor
