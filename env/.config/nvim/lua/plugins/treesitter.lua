return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
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
					"html",
					"css",
					"json",
					"yaml",
					"toml",
					"markdown",
					"markdown_inline",
					"bash",
					"dockerfile",
				},
				modules = {},
				ignore_install = {},
				sync_install = false,
				auto_install = true,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
			})
		end,
	},
}
