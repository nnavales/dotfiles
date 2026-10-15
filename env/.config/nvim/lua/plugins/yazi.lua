return {
	"mikavilpas/yazi.nvim",
	event = "VeryLazy",
	dependencies = { "folke/snacks.nvim" },
	keys = {
		{ "<leader>y", "<cmd>Yazi<cr>", desc = "Yazi (cwd)" },
		{ "<leader>Y", "<cmd>Yazi cwd<cr>", desc = "Yazi (nvim cwd)" },
	},
	opts = {
		open_for_directories = false,
	},
}
