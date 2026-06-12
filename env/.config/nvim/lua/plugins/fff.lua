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
	config = function(_, opts)
		local function set_fff_hl()
			local hl = vim.api.nvim_set_hl
			-- `default = true` => only applied if the active colorscheme
			-- didn't already define the group, so your theme always wins.
			hl(0, "FFFBorder", { default = true, link = "FloatBorder" })
			hl(0, "FFFNormal", { default = true, link = "NormalFloat" })
			hl(0, "FFFCursor", { default = true, link = "Visual" })
			hl(0, "FFFMatch", { default = true, link = "Special" })
			hl(0, "FFFTitle", { default = true, link = "Title" })
			hl(0, "FFFPrompt", { default = true, link = "NormalFloat" })
			hl(0, "FFFFrecency", { default = true, link = "Number" })
			hl(0, "FFFDebug", { default = true, link = "Comment" })
			hl(0, "FFFComboHeader", { default = true, link = "Number" })
			hl(0, "FFFDir", { default = true, link = "Comment" })
			hl(0, "FFFGrepLineNumber", { default = true, link = "LineNr" })
			hl(0, "FFFGrepRegexActive", { default = true, link = "DiagnosticInfo" })
			hl(0, "FFFGrepPlainActive", { default = true, link = "Comment" })
			hl(0, "FFFGrepFuzzyActive", { default = true, link = "DiagnosticHint" })
		end

		set_fff_hl()
		-- Re-apply on every colorscheme switch (colorscheme clears all hls).
		vim.api.nvim_create_autocmd("ColorScheme", {
			group = vim.api.nvim_create_augroup("FFFHighlights", { clear = true }),
			callback = set_fff_hl,
		})

		require("fff").setup(opts)
	end,
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
