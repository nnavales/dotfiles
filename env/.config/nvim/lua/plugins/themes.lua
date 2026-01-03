return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		config = function()
			local colors = require("config.colors")

			if colors.default_theme == "dark" then
				require("rose-pine").setup({
					variant = "moon",
					dark_variant = "moon",
					dim_inactive_windows = false,
					extend_background_behind_borders = true,
					styles = {
						italic = false,
						bold = false,
						transparency = true,
					},
				})
				ColorMyPencils("rose-pine-moon")
			else
				require("rose-pine").setup({
					variant = "dawn",
					dark_variant = "dawn",
					dim_inactive_windows = false,
					extend_background_behind_borders = true,
					styles = {
						italic = false,
						bold = false,
						transparency = false,
					},
				})
				ColorMyPencils("rose-pine-dawn")
			end
		end,
	},
	-- {
	-- 	"catppuccin/nvim",
	-- 	name = "catppuccin",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		local colors = require("config.colors")
	--
	-- 		if colors.default_theme == "dark" then
	-- 			require("catppuccin").setup({
	-- 				flavour = "mocha",
	-- 				transparent_background = false,
	-- 				term_colors = true,
	-- 				integrations = {
	-- 					cmp = true,
	-- 					gitsigns = true,
	-- 					nvimtree = true,
	-- 					treesitter = true,
	-- 					notify = false,
	-- 					mini = { enabled = true },
	-- 				},
	-- 			})
	-- 		else
	-- 			require("catppuccin").setup({
	-- 				flavour = "latte",
	-- 				transparent_background = false,
	-- 				term_colors = true,
	-- 				integrations = {
	-- 					cmp = true,
	-- 					gitsigns = true,
	-- 					nvimtree = true,
	-- 					treesitter = true,
	-- 					notify = false,
	-- 					mini = { enabled = true },
	-- 				},
	-- 			})
	-- 		end
	-- 	end,
	-- },

	{
		"embark-theme/vim",
		lazy = false,
		priority = 1000,
		name = "embark",
	},
}
