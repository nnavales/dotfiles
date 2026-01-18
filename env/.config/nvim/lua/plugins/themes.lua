return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		config = function()
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
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				transparent_background = true,
				term_colors = true,
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					treesitter = true,
					notify = false,
					mini = { enabled = true },
				},
			})
		end,
	},
	{
		{
			"scottmckendry/cyberdream.nvim",
			lazy = true,
			priority = 1000,
			config = function()
				require("cyberdream").setup({
					variant = "default",
					transparent = true,
					saturation = 1,
					italic_comments = false,
					terminal_colors = true,
					hide_fillchars = false,
				})
			end,
		},
		{
			"loctvl842/monokai-pro.nvim",
			lazy = true,
			priority = 1000,
			config = function()
				require("monokai-pro").setup({
					transparent_background = true,
					terminal_colors = true,
					devicons = true,
					styles = {
						comment = { italic = true },
						keyword = { italic = true }, -- any other keyword
						type = { italic = true }, -- (preferred) int, long, char, etc
						storageclass = { italic = true }, -- static, register, volatile, etc
						structure = { italic = true }, -- struct, union, enum, etc
						parameter = { italic = true }, -- parameter pass in function
						annotation = { italic = true },
						tag_attribute = { italic = true },
					},
					filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
				})
			end,
		},
	},
}
