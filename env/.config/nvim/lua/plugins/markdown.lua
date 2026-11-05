local function apply_markdown_colors()
	local bg = vim.api.nvim_get_hl(0, { name = "Normal", link = false }).bg
	if not bg then
		return
	end

	local function channel(color, shift)
		return bit.band(bit.rshift(color, shift), 0xff)
	end

	-- Blend each heading foreground with the normal background so the
	-- background bands follow the same color order as the headings.
	local function blend(fg, ratio)
		local r = math.floor(channel(fg, 16) * ratio + channel(bg, 16) * (1 - ratio))
		local g = math.floor(channel(fg, 8) * ratio + channel(bg, 8) * (1 - ratio))
		local b = math.floor(channel(fg, 0) * ratio + channel(bg, 0) * (1 - ratio))
		return r * 65536 + g * 256 + b
	end

	for level = 1, 6 do
		local fg = vim.api.nvim_get_hl(0, { name = "RenderMarkdownH" .. level, link = false }).fg
		if fg then
			vim.api.nvim_set_hl(0, "RenderMarkdownH" .. level .. "Bg", { bg = blend(fg, 0.16) })
		end
	end

	local float_bg = vim.api.nvim_get_hl(0, { name = "NormalFloat", link = false }).bg
	if float_bg then
		vim.api.nvim_set_hl(0, "RenderMarkdownCode", { bg = float_bg })
	end
end

return {
	{
		"obsidian-nvim/obsidian.nvim",
		version = "*",
		config = function()
			require("obsidian").setup({
				legacy_commands = false,
				-- Let render-markdown own the in-buffer rendering.
				ui = { enable = false },
				footer = {
					enabled = false,
				},

				workspaces = {
					{
						name = "personal",
						path = "~/personal/notes",
					},
				},

				picker = {
					name = "snacks.picker",
				},

				note_id_func = require("obsidian.builtin").title_id,

				notes_subdir = "new",
				new_notes_location = "notes_subdir",

				templates = {
					folder = "collections/templates",
					date_format = "YYYY-MM-DD",
					time_format = "HH:mm",
				},
				daily_notes = {
					enabled = true,
					folder = "journal",
					template = "daily_template.md",
					default_tags = { "daily" },
				},
			})

			vim.keymap.set("n", "<leader>o", "<cmd>Obsidian<cr>", {
				desc = "Obsidian",
			})
		end,
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" },
		---@module 'render-markdown'
		---@type render.md.UserConfig
		config = function(_, opts)
			require("render-markdown").setup(opts)

			apply_markdown_colors()
			vim.api.nvim_create_autocmd("ColorScheme", {
				group = vim.api.nvim_create_augroup("UserMarkdownColors", { clear = true }),
				callback = apply_markdown_colors,
			})
		end,
		opts = {
			render_modes = { "n", "c", "t" },
			completions = {
				lsp = { enabled = true },
			},
			heading = {
				-- Keep the '#' markers visible, like the reference setup.
				icons = {},
				sign = false,
				width = "full",
			},
			code = {
				sign = false,
				width = "block",
				right_pad = 1,
				border = "hide",
			},
			bullet = {
				-- A single small icon for every nesting level.
				icons = { "•" },
			},
			checkbox = {
				unchecked = { highlight = "RenderMarkdownBullet" },
				checked = { highlight = "RenderMarkdownBullet" },
				custom = {
					todo = { raw = "[-]", rendered = "󰥔 ", highlight = "RenderMarkdownBullet" },
				},
			},
			link = {
				enabled = false,
			},
			pipe_table = {
				style = "normal",
			},
			latex = {
				enabled = false,
			},
		},
	},
	{
		"antonk52/markdowny.nvim",
		config = function()
			require("markdowny").setup({
				filetypes = { "markdown" },
			})
		end,
	},
}
