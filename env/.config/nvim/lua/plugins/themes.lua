function ColorMyPencils()
	vim.cmd.colorscheme("paradise")
end

return {
	{
		"nnavales/rozefine",
		name = "rozefine",
		lazy = false,
		priority = 2000,
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
		"nnavales/paradise",
		lazy = false,
		priority = 1000,
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
		"nnavales/paragon",
		lazy = false,
		priority = 3000,
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
		priority = 4000,
		config = function()
			vim.g.everforest_enable_italic = true
			ColorMyPencils()
		end,
	},
}
