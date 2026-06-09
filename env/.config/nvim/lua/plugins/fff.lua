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
			border = "FFFBorder",
			normal = "FFFNormal",
			cursor = "FFFCursor",
			matched = "FFFMatch",
			title = "FFFTitle",
			prompt = "FFFPrompt",
			frecency = "FFFFrecency",
			debug = "FFFDebug",
			combo_header = "FFFComboHeader",
			directory_path = "FFFDir",
			grep_match = "FFFMatch",
			grep_line_number = "FFFGrepLineNumber",
			grep_regex_active = "FFFGrepRegexActive",
			grep_plain_active = "FFFGrepPlainActive",
			grep_fuzzy_active = "FFFGrepFuzzyActive",
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
