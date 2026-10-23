return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	config = function()
		require("mini.icons").setup()
		MiniIcons.mock_nvim_web_devicons()

		local function setup_lualine()
			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "pria_transparent",
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
						{ "branch", padding = { left = 0, right = 1 } },
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
					lualine_y = {
						{
							"tabs",
							mode = 2,
							padding = { left = 1, right = 1 },
							cond = function()
								return #vim.api.nvim_list_tabpages() > 1
							end,
						},
						{
							"filetype",
							padding = 0,
							cond = function()
								return #vim.api.nvim_list_tabpages() == 1
							end,
						},
					},
					lualine_z = {},
				},
				inactive_sections = {
					lualine_c = { "filename" },
				},
				tabline = {},
				winbar = {},
				extensions = { "lazy" },
			})
		end

		setup_lualine()
	end,
}
