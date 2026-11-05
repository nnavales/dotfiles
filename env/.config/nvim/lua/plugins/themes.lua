function ColorMyPencils()
	vim.cmd.colorscheme("pria")
end

return {
	{
		"nnavales/pria",
		lazy = false,
		priority = 1000,
		opts = {
			dim = false,
			borders = true,
			styles = {
				comments = { italic = false },
			},
		},
	},
	{
		"nnavales/rozefine",
		name = "rozefine",
		lazy = false,
		priority = 1001,
		config = function()
			require("rozefine").setup({
				dim_inactive_windows = true,
				extend_background_behind_borders = true,
				styles = {
					italic = false,
					bold = false,
					transparency = false,
				},
			})
		end,
	},
	{
		"nnavales/paragon",
		lazy = false,
		priority = 1001,
		opts = {
			borders = true,
			styles = {
				comments = { italic = false },
				builtins = { italic = false },
			},
		},
		config = function() end,
	},

	{
		"sainnhe/everforest",
		lazy = false,
		priority = 1001,
		config = function()
			vim.g.everforest_enable_italic = false
		end,
	},

	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1001,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
			})
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1001,
		opts = {},
	},

	{
		"rebelot/kanagawa.nvim",
		name = "kanagawa",
		priority = 1001,
		config = function()
			require("kanagawa").setup({
				theme = "wave", -- Load "wave" theme
				colors = {
					theme = {
						all = {
							ui = {
								bg_gutter = "none",
							},
						},
					},
				},
			})
		end,
	},
	{
		"navarasu/onedark.nvim",
		priority = 1001,
		config = function()
			require("onedark").setup({
				style = "dark",
			})
		end,
	},
}

-- {
-- 	dir = vim.fn.expand("~/personal/projects/pria"),
-- 	name = "pria",
-- 	lazy = false,
-- 	priority = 1001,
-- 	opts = {
-- 		borders = true,
-- 		styles = {
-- 			comments = { italic = true },
-- 			builtins = { italic = false },
-- 		},
-- 	},
-- 	config = function(_, opts)
-- 		require("pria").setup(opts)
-- 		require("pria").load()
-- 		require("pria").dev()
-- 		vim.keymap.set("n", "<leader>r", ":PriaReload<CR>", { desc = "Reload theme" })
-- 		vim.keymap.set("n", "<leader>t", ":PriaInspect<CR>", { desc = "Inspect highlight" })
-- 	end,
-- },
--
