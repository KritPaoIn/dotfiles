" language en_US.utf-8
let g:is_win = (has('win32') || has('win64')) ? v:true : v:false
let g:is_linux = (has('unix') && !has('macunix')) ? v:true : v:false
let g:is_mac = has('macunix') ? v:true : v:false

" Set Config Globals
lua << EOF
local utils = require("utils")
local config_file = vim.fn.stdpath("config") .. "/config.yaml"
vim.g.config = utils.read_yaml(config_file)
EOF

let g:python_host_prog = expand('$HOME/.pyenv/shims/python')
let g:python3_host_prog = expand('$HOME/.pyenv/shims/python3')

" Disable providers
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0
