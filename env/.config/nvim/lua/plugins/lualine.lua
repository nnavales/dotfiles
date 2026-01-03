return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	config = function()
		require("mini.icons").setup()
		MiniIcons.mock_nvim_web_devicons()

		local theme_colors = require("config.colors")

		local custom_theme = function()
			local colors = theme_colors.default_theme == "light" and theme_colors.light or theme_colors.dark

			return {
				normal = {
					a = { fg = colors.fg, bg = colors.bg, gui = "bold" },
					b = { fg = colors.fg, bg = colors.bg },
					c = { fg = colors.fg, bg = colors.bg },
				},
				insert = {
					a = { fg = colors.blue, bg = colors.bg, gui = "bold" },
					b = { fg = colors.fg, bg = colors.bg },
					c = { fg = colors.fg, bg = colors.bg },
				},
				visual = {
					a = { fg = colors.yellow, bg = colors.bg, gui = "bold" },
					b = { fg = colors.fg, bg = colors.bg },
					c = { fg = colors.fg, bg = colors.bg },
				},
				replace = {
					a = { fg = colors.red, bg = colors.bg, gui = "bold" },
					b = { fg = colors.fg, bg = colors.bg },
					c = { fg = colors.fg, bg = colors.bg },
				},
				command = {
					a = { fg = colors.green, bg = colors.bg, gui = "bold" },
					b = { fg = colors.fg, bg = colors.bg },
					c = { fg = colors.fg, bg = colors.bg },
				},
				inactive = {
					a = { fg = colors.fg, bg = colors.bg },
					b = { fg = colors.fg, bg = colors.bg },
					c = { fg = colors.fg, bg = colors.bg },
				},
			}
		end

		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = custom_theme(),
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				globalstatus = true,
				disabled_filetypes = {
					statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" },
				},
				always_divide_middle = true,
				refresh = {
					statusline = 300,
					tabline = 100,
					winbar = 100,
				},
			},
			sections = {
				lualine_a = { { "mode", padding = { left = 1, right = 0 } } },
				lualine_b = {
					{
						"filename",
						path = 4,
						shorting_target = 60,
						symbols = {
							modified = "[+]",
							readonly = "",
							unnamed = "No Name",
							newfile = "New",
							padding = { left = 1, right = 1 },
						},
					},
				},
				lualine_x = {
					{ "branch", icon = { "", color = { fg = "#eb6f92" } }, padding = { left = 0, right = 1 } },
					{
						"diff",
						symbols = { added = "+", modified = "~", removed = "-" },
						padding = { left = 0, right = 1 },
					},
				},
				lualine_c = {
					{
						"diagnostics",
						padding = { left = 0, right = 1 },
					},
				},
				lualine_y = { { "filetype", padding = 0 } },
				lualine_z = {},
			},
			inactive_sections = {
				lualine_c = { "filename" },
			},
			tabline = {},
			winbar = {},
			extensions = { "lazy" },
		})
	end,
}
