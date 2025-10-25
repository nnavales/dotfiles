return {
	-- Treesitter Playground
	{
		"nvim-treesitter/playground",
		dependencies = "nvim-treesitter/nvim-treesitter",
	},

	-- Vim be good
	{ "ThePrimeagen/vim-be-good" },

	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
		lazy = true,
		event = "InsertEnter",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load({
				include = {
					-- Frontend
					"javascript",
					"javascriptreact",
					"typescript",
					"typescriptreact",
					"html",
					"css",

					-- Backend / CLI
					"python",
					"go",

					-- Config
					"lua",
				},
			})
		end,
	},

	-- Venv Selector
	{
		"linux-cultist/venv-selector.nvim",
		cmd = "VenvSelect",
		dependencies = {
			"neovim/nvim-lspconfig",
			"mfussenegger/nvim-dap",
			"mfussenegger/nvim-dap-python", -- optional
			{ "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
		},
		lazy = true,
		branch = "regexp",
		config = function()
			require("venv-selector").setup({
				name = ".venv",
			})
		end,
		keys = {
			{ "<leader>vs", "<cmd>VenvSelect<cr>" },
		},
	},
}
