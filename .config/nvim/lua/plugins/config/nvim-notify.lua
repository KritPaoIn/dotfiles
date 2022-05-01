local nvim_notify = require("notify")
vim.notify = nvim_notify

nvim_notify.setup({
	-- Animation style
	stages = "slide",
	-- Default timeout for notifications
	timeout = 3000,
	render = "default",
	icons = {
		ERROR = vim.g.config.icons.diagnostic.error,
		WARN = vim.g.config.icons.diagnostic.warn,
		INFO = vim.g.config.icons.diagnostic.info,
		DEBUG = "",
		TRACE = "✎",
	},
})

vim.cmd([[
highlight! link NotifyERRORBorder DiagnosticError
highlight! link NotifyWARNBorder DiagnosticWarn
highlight! link NotifyINFOBorder DiagnosticInfo
highlight! link NotifyDEBUGBorder DiagnosticHint
highlight! link NotifyTRACEBorder DiagnosticHint

highlight! link NotifyERRORIcon DiagnosticError
highlight! link NotifyWARNIcon DiagnosticWarn
highlight! link NotifyINFOIcon DiagnosticInfo
highlight! link NotifyDEBUGIcon DiagnosticHint
highlight! link NotifyTRACEIcon DiagnosticHint

highlight! link NotifyERRORTitle DiagnosticError
highlight! link NotifyWARNTitle DiagnosticWarn
highlight! link NotifyINFOTitle DiagnosticInfo
highlight! link NotifyDEBUGTitle DiagnosticHint
highlight! link NotifyTRACETitle DiagnosticHint

highlight! link NotifyERRORBody Normal
highlight! link NotifyWARNBody Normal
highlight! link NotifyINFOBody Normal
highlight! link NotifyDEBUGBody Normal
highlight! link NotifyTRACEBody Normal
]])
