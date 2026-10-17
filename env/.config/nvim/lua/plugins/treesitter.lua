return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			-- Set up nvim-treesitter. Set install_dir only if you need it.
			require("nvim-treesitter").setup({
				install_dir = vim.fn.stdpath("data") .. "/site",
			})

			-- Install the parsers.
			require("nvim-treesitter").install({
				"lua",
				"vim",
				"vimdoc",
				"query",
				"regex",
				"markdown_inline",
				"svelte",
				"python",
				"javascript",
				"typescript",
				"tsx",
				"go",
				"c",
				"cpp",
				"html",
				"css",
				"json",
				"yaml",
				"java",
				"php",
				"ruby",
				"rust",
				"zig",
				"sql",
				"toml",
				"markdown",
				"bash",
				"dockerfile",
			})

			-- Enable treesitter features automatically.
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"lua",
					"vim",
					"vimdoc",
					"query",
					"svelte",
					"python",
					"javascript",
					"javascriptreact",
					"typescript",
					"typescriptreact",
					"tsx",
					"go",
					"c",
					"cpp",
					"html",
					"css",
					"json",
					"yaml",
					"java",
					"php",
					"ruby",
					"rust",
					"sql",
					"toml",
					"markdown",
					"bash",
					"dockerfile",
				},
				callback = function()
					vim.treesitter.start()
				end,
			})
		end,
	},
}
