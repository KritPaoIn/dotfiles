vim.g.neoformat_enabled_python = { "black" }
vim.g.neoformat_enabled_lua = { "stylua" }
vim.g.neoformat_enabled_javascript = { "prettier" }
vim.g.neoformat_enabled_typescript = { "prettier" }
vim.g.neoformat_enabled_css = { "prettier" }
vim.g.neoformat_enabled_html = { "prettier" }
vim.g.neoformat_enabled_rust = { "rustfmt" }

vim.g.neoformat_try_node_exe = true

vim.keymap.set("n", "<Leader>n", "<Cmd>Neoformat<CR>")
