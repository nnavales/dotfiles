return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("nvim-treesitter.configs").setup({
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer", -- around function
						["if"] = "@function.inner", -- inside function
					},

					selection_modes = {
						["@parameter.outer"] = "v",
						["@function.outer"] = "V",
						["@class.outer"] = "V",
					},
				},

				move = {
					enable = true,
					set_jumps = true,

					goto_next_start = {
						["]f"] = "@function.outer",
						["]c"] = "@class.outer",
					},

					goto_previous_start = {
						["[f"] = "@function.outer",
						["[c"] = "@class.outer",
					},
				},
			},
		})
	end,
}
