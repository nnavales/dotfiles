return {
	"folke/noice.nvim",
	dependencies = { "MunifTanjim/nui.nvim" },
	config = function()
		require("noice").setup({
			cmdline = {
				enabled = true,
				view = "cmdline",
			},

			messages = {
				enabled = true,
				view = "mini",
				view_error = "mini",
				view_warn = "mini",
			},

			popupmenu = {
				enabled = true,
			},

			notify = {
				enabled = true,
			},

			lsp = {

				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
				hover = { enabled = true },
				signature = { enabled = true },
				message = { enabled = true },
				progress = { enabled = false },
			},

			health = {
				checker = false,
			},

			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = false,
				inc_rename = false,
				lsp_doc_border = false,
			},
		})
	end,
}
