local map = vim.keymap.set
local silent = { silent = true }
local expr_options = { expr = true, silent = true }

vim.g.mapleader = ","

map({ "n", "x" }, ";", ":")

map("n", "k", "v:count == 0 ? 'gk' : 'k'", expr_options)
map("n", "j", "v:count == 0 ? 'gj' : 'j'", expr_options)

map("n", "^", "g^")
map("n", "0", "g0")

map("n", "<Space>o", "printf('m`%so<ESC>``', v:count1)", expr_options)
map("n", "<Space>O", "printf('m`%sO<ESC>``', v:count1)", expr_options)

map({ "n", "x" }, "c", '"_c')
map("n", "C", '"_C')
map("n", "cc", '"_cc')

map("x", "p", "\"_c<Esc>p")

map({ "n", "x" }, "y", "myy")

map({ "o", "v" }, "a'", "2i'")
map({ "o", "v" }, "a\"", "2i\"")

map("n", "*", "<Cmd>keepjumps normal! mi*`i<CR>")

map("n", "<Leader><Space>", "StripWhitespace")

vim.g.tmux_navigator_no_mappings = true
map("n", "<C-h>", "<Cmd>TmuxNavigateLeft<CR>", silent)
map("n", "<C-j>", "<Cmd>TmuxNavigateDown<CR>", silent)
map("n", "<C-k>", "<Cmd>TmuxNavigateUp<CR>", silent)
map("n", "<C-l>", "<Cmd>TmuxNavigateRight<CR>", silent)

map("n", "<Esc>", "<Cmd>nohlsearch<CR>")

map("n", "<S-CR>", "o<Esc>")
map("i", "<S-CR>", "<Esc>o")
