local utils = require("utils")
local M = {}

function M.show_line_diagnostics()
	local opts = {
		focusable = false,
		close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
		source = "always", -- show source in diagnostic popup window
		prefix = " ",
	}
	vim.diagnostic.open_float(nil, opts)
end

local opts = { silent = true, noremap = true }
local attachment = function(client, bufnr)
	local map = vim.api.nvim_buf_set_keymap

	map(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
	map(bufnr, "n", "gp", "<Cmd>Lspsaga preview_definition<CR>", opts)
	map(bufnr, "n", "gr", "<Cmd>Lspsaga rename<CR>", opts)
	map(bufnr, "n", "gx", "<Cmd>Lspsaga code_action<CR>", opts)
	map(bufnr, "n", "gh", "<Cmd>Lspsaga lsp_finder<CR>", opts)
	map(bufnr, "x", "gx", ":<C-u>Lspsaga range_code_action<CR>", opts)
	map(bufnr, "n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
	map(bufnr, "n", "go", "<Cmd>Lspsaga show_line_diagnostics<CR>", opts)
	map(bufnr, "n", "gj", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
	map(bufnr, "n", "gk", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
	-- map(bufnr, "n", "<C-u>", "<Cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1, '<C-u>')<CR>", {})
	-- map(bufnr, "n", "<C-d>", "<Cmd>lua require('lspsaga.action').smart_scroll_with_saga(1, '<C-d>')<CR>", {})
	map(bufnr, "n", "<A-d>", "<Cmd>Lspsaga open_floaterm<CR>", opts)
	map(bufnr, "n", "<A-c>", "<Cmd>Lspsaga close_floaterm<CR>", opts)

	if vim.g.logging_level == "debug" then
		local msg = string.format("Language server %s started!", client.name)
		vim.notify(msg, "info", { title = "Nvim-config" })
	end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

local lspconfig = require("lspconfig")
local coq = require("coq")

if utils.executable("pylsp") then
	lspconfig.pylsp.setup(coq.lsp_ensure_capabilities({
		on_attach = attachment,
		settings = {
			pylsp = {
				plugins = {
					pylint = { enabled = true, executable = "pylint" },
					pyflakes = { enabled = false },
					pycodestyle = { enabled = false },
					jedi_completion = { fuzzy = true },
					pyls_isort = { enabled = true },
					pylsp_mypy = { enabled = false },
				},
			},
		},
		flags = {
			debounce_text_changes = 200,
		},
		capabilities = capabilities,
	}))
end

-- if utils.executable("tailwindcss-language-server") then
-- 	lspconfig.tailwindcss.setup(coq.lsp_ensure_capabilities({
-- 		on_attach = attachment,
-- 		capabilities = capabilities,
-- 	}))
-- end

if utils.executable("pyright") then
	lspconfig.pyright.setup({
		on_attach = attachment,
		capabilities = capabilities,
	})
end

if utils.executable("clangd") then
	lspconfig.clangd.setup({
		on_attach = attachment,
		capabilities = capabilities,
		filetypes = { "c", "cpp", "cc" },
		flags = {
			debounce_text_changes = 500,
		},
	})
end

-- npm i -g typescript-language-server
if utils.executable("typescript-language-server") then
	lspconfig.tsserver.setup(coq.lsp_ensure_capabilities({
		on_attach = attachment,
		capabilities = capabilities,
	}))
end

-- npm i -g vim-language-server
if utils.executable("vim-language-server") then
	lspconfig.vimls.setup(coq.lsp_ensure_capabilities({
		on_attach = attachment,
		flags = {
			debounce_text_changes = 500,
		},
		capabilities = capabilities,
	}))
end

-- set up bash-language-server
if utils.executable("bash-language-server") then
	lspconfig.bashls.setup(coq.lsp_ensure_capabilities({
		on_attach = attachment,
		capabilities = capabilities,
	}))
end

if utils.executable("rust-analyzer") then
	lspconfig.rust_analyzer.setup(coq.lsp_ensure_capabilities({
		on_attach = attachment,
		capabilities = capabilities,
		settings = {
			["rust_analyzer"] = {
				checkOnSave = {
					command = "clippy",
				},
			},
		},
	}))
end

local sumneko_binary_path = vim.fn.exepath("lua-language-server")
if sumneko_binary_path ~= "" then
	local sumneko_root_path = vim.fn.fnamemodify(sumneko_binary_path, ":h:h")

	local runtime_path = vim.split(package.path, ";")
	runtime_path[#runtime_path + 1] = "lua/?.lua"
	runtime_path[#runtime_path + 1] = "lua/?/init.lua"

	lspconfig.sumneko_lua.setup(coq.lsp_ensure_capabilities({
		on_attach = attachment,
		cmd = { sumneko_binary_path, "-E", sumneko_root_path .. "/main.lua" },
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT",
					path = runtime_path,
				},
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true),
				},
				telemetry = {},
			},
		},
		capabilities = capabilities,
	}))
end

-- npm i -g emmet-ls
if utils.executable("emmet-ls") then
	lspconfig.emmet_ls.setup(coq.lsp_ensure_capabilities({
		on_attach = attachment,
		capabilities = capabilities,
		filetypes = {
			"html",
			"css",
			"htmldjango",
			"typescriptreact",
			"javascriptreact",
			"javascript",
			"typescript",
			"javascript.tsx",
			"typescript.tsx",
			"vue",
		},
	}))
end

-- npm i -g vscode-langservers-extracted
if utils.executable("vscode-eslint-language-server") then
	lspconfig.eslint.setup(coq.lsp_ensure_capabilities({
		on_attach = attachment,
		capabilities = capabilities,
		filetypes = {
			"typescriptreact",
			"javascriptreact",
			"javascript",
			"typescript",
			"javascript.tsx",
			"typescript.tsx",
			"vue",
		},
	}))
end

-- Change diagnostic signs.
vim.fn.sign_define("DiagnosticSignError", {
	text = " " .. vim.g.config.icons.diagnostic.error,
	texthl = "DiagnosticSignError",
})
vim.fn.sign_define("DiagnosticSignWarn", {
	text = " " .. vim.g.config.icons.diagnostic.warn,
	texthl = "DiagnosticSignWarn",
})
vim.fn.sign_define("DiagnosticSignInfo", {
	text = " " .. vim.g.config.icons.diagnostic.info,
	texthl = "DiagnosticSignInfo",
})
vim.fn.sign_define("DiagnosticSignHint", {
	text = " " .. vim.g.config.icons.diagnostic.hint,
	texthl = "DiagnosticSignHint",
})

-- global config for diagnostic
vim.diagnostic.config({
	underline = false,
	virtual_text = false,
	signs = true,
	severity_sort = true,
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = {
		spacing = 4,
		prefix = "",
		-- severity_limit = "Info"
	},
})
return M
