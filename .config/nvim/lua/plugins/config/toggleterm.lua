local map = vim.keymap.set

require("toggleterm").setup({
	size = 10,
	open_mapping = [[<c-\>]],
    -- direction = "float",
    start_in_insert = true,
    on_open = function()
        map("t", "<Esc>", [[<C-\><C-n>]])
    end,
    on_close = function()
        vim.cmd([[tunmap <silent> <Esc>]])
    end,
})
