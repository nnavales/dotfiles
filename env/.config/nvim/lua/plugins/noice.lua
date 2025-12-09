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
				view = "notify",
				view_error = "notify",
				view_warn = "notify",
			},
			popupmenu = {
				enabled = true,
			},
			notify = {
				enabled = true,
				view = "notify",
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
			routes = {
				{
					filter = {
						event = "msg_show",
						kind = "",
						find = "written",
					},
					opts = { skip = true },
				},
			},
			views = {
				notify = {
					replace = true,
					merge = true,
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = false,
				lsp_doc_border = true,
			},
		})
	end,
}
