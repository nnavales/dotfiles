return {
	"obsidian-nvim/obsidian.nvim",
	version = "*",
	config = function()
		require("obsidian").setup({
			legacy_commands = false,
			footer = {
				enabled = false,
			},

			workspaces = {
				{
					name = "personal",
					path = "~/personal/notes",
				},
			},

			picker = {
				name = "snacks.picker",
			},

			note_id_func = require("obsidian.builtin").title_id,

			notes_subdir = "new",
			new_notes_location = "notes_subdir",

			templates = {
				folder = "templates",
				date_format = "YYYY-MM-DD",
				time_format = "HH:mm",
			},
		})

		vim.keymap.set("n", "<leader>o", "<cmd>Obsidian<cr>", {
			desc = "Obsidian",
		})
	end,
}
