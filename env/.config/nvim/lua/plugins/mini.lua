return {
	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.pairs").setup({
				modes = { insert = true, command = true, terminal = false },
			})

			require("mini.move").setup({
				mappings = {
					left = "H",
					right = "L",
					down = "J",
					up = "K",
				},
			})
		end,
	},
}
