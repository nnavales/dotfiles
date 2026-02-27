function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)
	if color:match("rose%-pine") then
		vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1e2126" })
		vim.api.nvim_set_hl(0, "Visual", { bg = "#33364a", blend = 30 })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1a1d23" })
		vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#33364a", bg = "#1a1d23" })
		vim.api.nvim_set_hl(0, "CmpCursorLine", { bg = "#33364a" })
		vim.api.nvim_set_hl(0, "SnacksPickerBorder", { fg = "#1a1d23", bg = "#1a1d23" })
		vim.api.nvim_set_hl(0, "SnacksPickerPreview", { bg = "#1a1d23" })
		vim.api.nvim_set_hl(0, "SnacksPickerList", { bg = "#1a1d23" })
		vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = "#a6acb9" })
		vim.api.nvim_set_hl(0, "SnacksDashboardKey", { fg = "#e0def4", bold = true })
		vim.api.nvim_set_hl(0, "SnacksDashboardDesc", { fg = "#e0def4" })
		vim.api.nvim_set_hl(0, "SnacksDashboardIcon", { fg = "#e0def4" })
	end
end

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
			-- ColorMyPencils("rose-pine")
		end,
	},
	{
		"nnavales/paragon",
		lazy = false,
		priority = 1000,
		opts = {
			borders = true,
			styles = {
				comments = { italic = false },
				builtins = { italic = false },
			},
		},
		config = function()
			ColorMyPencils("paragon")
		end,
	},
}
