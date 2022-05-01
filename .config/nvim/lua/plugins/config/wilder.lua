local wilder = require("wilder")
wilder.setup({ modes = { ":" } })

-- wilder.set_option("pipeline", {
-- 	wilder.branch(
-- 		wilder.python_file_finder_pipeline({
-- 			file_command = { "fd", "-tf" },
-- 			dir_command = { "fd", "-td" },
-- 			filters = { "fuzzy_filter", "difflib_sorter" },
-- 		}),
-- 		wilder.cmdline_pipeline(),
-- 		wilder.python_search_pipeline()
-- 	),
-- })

wilder.set_option(
	"renderer",
	wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
		highlights = {
            default = "Normal",
			accent = wilder.make_hl("WilderAccent", "Normal", {
				{ a = 1 },
				{ a = 1 },
				{ foreground = "#00BAFF" },
			}),
            border = "Normal",
		},
        border = "single",
		highlighter = wilder.basic_highlighter(),
		left = { " ", wilder.popupmenu_devicons() },
		right = { " ", wilder.popupmenu_scrollbar() },
		apply_incsearch_fix = true,
	}))
)
