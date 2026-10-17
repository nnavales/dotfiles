return {
	"MagicDuck/grug-far.nvim",
	config = function()
		require("grug-far").setup({})
	end,
	keys = {
		{ "<leader>S", "<cmd>GrugFar<cr>", desc = "GrugFar search/replace", mode = { "n", "v" } },
	},
}
