local M = {}

M.dark = {
	fg = "#e0def4",
	bg = "NONE",
	yellow = "#f6c177",
	cyan = "#9ccfd8",
	green = "#b6e07d",
	orange = "#ea9a97",
	violet = "#c4a7e7",
	magenta = "#e84a5f",
	blue = "#3e8fb0",
	red = "#eb6f92",
}

M.light = {
	fg = "#575279",
	bg = "NONE",
	yellow = "#ea9d34",
	cyan = "#56949f",
	green = "#40a02b",
	orange = "#fe640b",
	violet = "#907aa9",
	magenta = "#ea76cb",
	blue = "#286983",
	red = "#b4637a",
}

M.default_theme = "dark"

function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	if M.default_theme == "dark" then
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
	elseif M.default_theme == "light" then
		vim.api.nvim_set_hl(0, "CursorLine", { bg = "#f4ede8" })
		vim.api.nvim_set_hl(0, "Visual", { bg = "#dfdad9", blend = 30 })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#faf4ed" })
		vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#dfdad9", bg = "#faf4ed" })
		vim.api.nvim_set_hl(0, "CmpCursorLine", { bg = "#dfdad9" })
		vim.api.nvim_set_hl(0, "SnacksPickerBorder", { fg = "#faf4ed", bg = "#faf4ed" })
		vim.api.nvim_set_hl(0, "SnacksPickerPreview", { bg = "#faf4ed" })
		vim.api.nvim_set_hl(0, "SnacksPickerList", { bg = "#faf4ed" })
		vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = "#797593" })
		vim.api.nvim_set_hl(0, "SnacksDashboardKey", { fg = "#575279", bold = true })
		vim.api.nvim_set_hl(0, "SnacksDashboardDesc", { fg = "#575279" })
		vim.api.nvim_set_hl(0, "SnacksDashboardIcon", { fg = "#575279" })
	end
end

return M
