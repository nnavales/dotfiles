return {
	"dmtrKovalenko/fff.nvim",
	build = function()
		require("fff.download").download_or_build_binary()
	end,
	opts = {
		debug = {
			enabled = false,
			show_scores = false,
		},
		prompt = "> ",
		title = "Files",
		layout = {
			prompt_position = "top",
			preview_position = "right",
			show_scrollbar = false,
			path_shorten_strategy = "middle_number",
		},
		hl = {
			border = "FloatBorder",
			normal = "NormalFloat",
			cursor = "Visual",
			matched = "Special",
			title = "Title",
			prompt = "NormalFloat",
			frecency = "Number",
			debug = "Comment",
			combo_header = "Number",
			directory_path = "Comment",
			grep_match = "Special",
			grep_line_number = "LineNr",
			grep_regex_active = "DiagnosticInfo",
			grep_plain_active = "Comment",
			grep_fuzzy_active = "DiagnosticHint",
		},
	},
	keys = {
		{
			"<leader>ff",
			function()
				require("fff").find_files()
			end,
			desc = "FFFind files",
		},
		{
			"<leader>/",
			function()
				require("fff").live_grep()
			end,
			desc = "LiFFFe grep",
		},
		{
			"<leader>w",
			function()
				require("fff").live_grep({ query = vim.fn.expand("<cword>") })
			end,
			desc = "Search current word",
		},
	},
}
