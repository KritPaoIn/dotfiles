let g:neoformat_enabled_python = ['black']
let g:neoformat_enabled_lua = ['stylua']
let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_enabled_typescript = ['prettier']
let g:neoformat_enabled_javascriptreact = ['prettier']
let g:neoformat_enabled_typescriptreact = ['prettier']
let g:neoformat_enabled_css = ['prettier']
let g:neoformat_enabled_html = ['prettier']
let g:neoformat_enabled_rust = ['rustfmt']

let g:neoformat_try_node_exe = 1

nnoremap <Leader>n <Cmd>Neoformat<CR>
