return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		animate = { enabled = true },
		bigfile = { enabled = true },
		image = { enabled = true },
		toggle = { enabled = false },
		-- que onda
		dashboard = { enbaled = false },
		notifier = { enabled = false },
		explorer = { enabled = false },
		statuscolumn = { enabled = false },
		words = { enabled = false },
		scroll = { enabled = false },
		input = { enabled = true },
		lazygit = { enabled = false },
		picker = {
			previewers = {
				diff = { builtin = false },
				git = { builtin = false },
			},
			layout = { preset = "default" },
			sources = {
				files = {
					hidden = true,
				},
				grep = {
					hidden = true,
				},
				select = {
					kinds = {
						sidekick_cli = {
							layout = { preset = "vscode" },
						},
						sidekick_prompt = {
							layout = { preset = "vscode" },
						},
					},
				},
			},
		},
		quickfile = { enabled = true },
		scope = { enabled = true },
		gitbrowse = { enabled = true },
	},

	keys = {

		{
			"<leader>gB",
			function()
				Snacks.gitbrowse()
			end,
			desc = "Git Browse",
			mode = { "n", "v" },
		},
		{
			"<leader>gb",
			function()
				Snacks.git.blame_line()
			end,
			desc = "Git Blame Line",
		},
		{
			"<leader>gf",
			function()
				Snacks.lazygit.log_file()
			end,
			desc = "Lazygit Current File History",
		},
		{
			"<leader>gg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"<leader>gl",
			function()
				Snacks.picker.git_log()
			end,
			desc = "Git Log",
		},
		{
			"<leader>gs",
			function()
				Snacks.picker.git_status()
			end,
			desc = "Git Status",
		},
		{
			"<leader>gd",
			function()
				Snacks.picker.git_diff()
			end,
			desc = "Git Diff",
		},

		{
			"<leader>/",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},

		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>fw",
			function()
				Snacks.picker.grep_word()
			end,
			desc = "Visual selection or word",
			mode = { "n", "x" },
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.git_files()
			end,
			desc = "Find Git Files",
		},
		{
			"<leader>fb",
			function()
				Snacks.picker.lines()
			end,
			desc = "Buffer Lines",
		},

		{
			"<leader>xX",
			function()
				Snacks.picker.diagnostics({
					layout = {
						preset = "default",
						preview = false,
					},
				})
			end,
			desc = "Diagnostics",
		},
		{
			"<leader>xx",
			function()
				Snacks.picker.diagnostics_buffer({
					layout = {
						preset = "default",
						preview = false,
					},
				})
			end,
			desc = "Buffer Diagnostics",
		},
		{
			"<leader>hh",
			function()
				Snacks.picker.help()
			end,
			desc = "Help Pages",
		},
		{
			"<leader>hH",
			function()
				Snacks.picker.highlights()
			end,
			desc = "Highlights",
		},
		{
			"<leader>hk",
			function()
				Snacks.picker.keymaps()
			end,
			desc = "Keymaps",
		},
		{
			"<leader>hM",
			function()
				Snacks.picker.man()
			end,
			desc = "Man Pages",
		},
		{
			"<leader>hC",
			function()
				Snacks.picker.colorschemes()
			end,
			desc = "Colorschemes",
		},
		{
			"<leader>hc",
			function()
				Snacks.picker.commands()
			end,
			desc = "Commands",
		},
		{
			"<leader>hu",
			function()
				Snacks.picker.undo()
			end,
			desc = "Undo History",
		},
	},
}
