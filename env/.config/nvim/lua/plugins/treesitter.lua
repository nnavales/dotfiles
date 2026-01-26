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
				"regex",
				"c",
				"html",
				"css",
				"json",
				"yaml",
				"toml",
				"markdown",
				"markdown_inline",
				"bash",
				"dockerfile",
			})

			-- Habilitar treesitter features automáticamente
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"lua",
					"vim",
					"svelte",
					"python",
					"javascript",
					"typescript",
					"tsx",
					"go",
					"c",
					"html",
					"css",
					"json",
					"yaml",
					"toml",
					"markdown",
					"bash",
				},
				callback = function()
					vim.treesitter.start()
				end,
			})
		end,
	},
}
