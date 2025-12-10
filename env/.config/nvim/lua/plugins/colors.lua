function ColorMyPencils(color)
	color = color or "rose-pine-moon"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1e2126" })
	vim.api.nvim_set_hl(0, "Visual", { bg = "#33364a", blend = 30 })
	-- general (lsp, dignostics, cmp)
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1a1d23" })
	vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#33364a", bg = "#1a1d23" })
	vim.api.nvim_set_hl(0, "CmpCursorLine", { bg = "#33364a" })
	-- snacks
	vim.api.nvim_set_hl(0, "SnacksPickerBorder", { fg = "#1a1d23", bg = "#1a1d23" })
	vim.api.nvim_set_hl(0, "SnacksPickerPreview", { bg = "#1a1d23" })
	vim.api.nvim_set_hl(0, "SnacksPickerList", { bg = "#1a1d23" })

	vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = "#a6acb9" })
	vim.api.nvim_set_hl(0, "SnacksDashboardKey", { fg = "#e0def4", bold = true })
	vim.api.nvim_set_hl(0, "SnacksDashboardDesc", { fg = "#e0def4" })
	vim.api.nvim_set_hl(0, "SnacksDashboardIcon", { fg = "#e0def4" })
end

return {
	{
		"rose-pine/neovim",
		lazy = false,
		priority = 1000,
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				variant = "moon", -- auto, main, moon, or dawn
				dark_variant = "moon", -- main, moon, or dawn
				dim_inactive_windows = false,
				extend_background_behind_borders = true,

				styles = {
					italic = false,
					bold = false, -- true if you want: bold folders
					transparency = true,
				},
			})
			ColorMyPencils()
		end,
	},
	{
		"folke/tokyonight.nvim",
		config = function()
			require("tokyonight").setup({
				style = "moon",
				transparent = true,
				styles = {
					sidebars = "transparent",
					floats = "transparent",
				},
				dim_inactive = true,
				lualine_bold = true,
			})
		end,
	},

	{
		"nyoom-engineering/oxocarbon.nvim",
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
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
		"sainnhe/everforest",
		config = function()
			vim.g.everforest_enable_italic = true
			vim.g.everforest_background = "hard"
			vim.g.everforest_transparent_background = 2
			vim.g.everforest_better_performance = 1
		end,
	},

	{
		"olivercederborg/poimandres.nvim",
		config = function()
			require("poimandres").setup({
				disable_background = true,
				disable_float_background = true,
				bold_vert_split = true,
				dim_nc_background = false,
			})
		end,
	},
}
