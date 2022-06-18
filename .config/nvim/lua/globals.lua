local utils = require("utils")

local config_file = os.getenv("HOME") .. "/.dotfiles" .. "/config.yaml"
local fn = vim.fn
local yaml_config = utils.read_yaml(config_file)
if yaml_config.nvim.theme == "inherit" then
    yaml_config.nvim.theme = yaml_config.iterm2.theme
end
vim.g.config = yaml_config.nvim

vim.g.is_win = fn.has("win32") == 1 or fn.has("win64") == 1
vim.g.is_linux = fn.has("unix") == 1 and not fn.has("macunix") == 1
vim.g.is_mac = fn.has("macunix") == 1

vim.g.autotagStartMethod = "fork"

vim.g.python_host_prog = vim.fn.expand("$HOME/.pyenv/shims/python")
vim.g.python3_host_prog = vim.fn.expand("$HOME/.pyenv/shims/python3")
vim.g.ruby_host_prog = vim.fn.expand("/usr/local/Cellar/ruby/3.1.2/bin/gem")
vim.g.loaded_perl_provider = 0
