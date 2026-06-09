return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			-- Setup de nvim-treesitter (solo si necesitas configurar install_dir)
			require("nvim-treesitter").setup({
				install_dir = vim.fn.stdpath("data") .. "/site",
			})

			-- Instalar parsers
			require("nvim-treesitter").install({
				"lua",
				"vim",
				"vimdoc",
				"query",
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

			-- Habilitar treesitter features automáticamente
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
