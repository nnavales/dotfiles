return {
	"obsidian-nvim/obsidian.nvim",
	version = "*",
	---@module 'obsidian'
	---@type obsidian.config
	opts = {
		legacy_commands = false,
		workspaces = {
			{
				name = "personal",
				path = "/home/nahuel/personal/hub/notes/",
			},
		},
	},

	config = function(_, opts)
		require("obsidian").setup(opts)
		vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<cr>", { desc = "New note" })
		vim.keymap.set("n", "<leader>ob", "<cmd>ObsidianBacklinks<cr>", { desc = "Backlinks" })
		vim.keymap.set("n", "<leader>or", "<cmd>ObsidianRename<cr>", { desc = "Rename note" })
		vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianTags<cr>", { desc = "Tags" })
		vim.keymap.set("n", "<leader>ol", "<cmd>ObsidianLinks<cr>", { desc = "Links" })
	end,
}
