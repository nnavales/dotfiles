return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	config = function()
		require("mini.icons").setup()
		MiniIcons.mock_nvim_web_devicons()

		local colors = {
			violet = "#B895DE",
			blue = "#5AA6E6",
			green = "#5FC878",
			yellow = "#E4C56B",
			teal = "#5FD3BB",
			cyan = "#A1DEEA",
			fg = "#DCE5E5",
			dim = "#4B5B63",
		}

		local custom_theme = function()
			-- Use the editor's actual Normal background so the statusline
			-- always blends in, regardless of terminal transparency.
			local normal = vim.api.nvim_get_hl(0, { name = "Normal", link = false })
			local bg = normal.bg and string.format("#%06x", normal.bg) or "NONE"
			local fg = colors.fg
			local dim = colors.dim
			local cyan = colors.cyan
			local blue = colors.blue
			local yellow = colors.yellow
			local green = colors.green
			local violet = colors.violet
			local teal = colors.teal

			local function mode(accent)
				return {
					a = { fg = accent, bg = bg, gui = "bold" },
					b = { fg = fg, bg = bg },
					c = { fg = dim, bg = bg },
				}
			end

			return {
				normal = mode(cyan),
				insert = mode(green),
				visual = mode(yellow),
				replace = mode(violet),
				command = mode(blue),
				terminal = mode(teal),
				inactive = {
					a = { fg = dim, bg = bg },
					b = { fg = dim, bg = bg },
					c = { fg = dim, bg = bg },
				},
			}
		end

		local function setup_lualine()
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
		end

		setup_lualine()

		-- Re-apply after any colorscheme load so it can't clobber lualine's
		-- highlight groups (this is what kills the colors / transparency).
		vim.api.nvim_create_autocmd("ColorScheme", {
			group = vim.api.nvim_create_augroup("LualineTransparent", { clear = true }),
			callback = setup_lualine,
		})
	end,
}
