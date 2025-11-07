return {
	"williamboman/mason.nvim",
	cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog", "MasonUpdate" },
	event = { "VeryLazy" },
	dependencies = {
		{
			"williamboman/mason-lspconfig.nvim",
			lazy = true,
		},
		{
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			lazy = true,
		},
	},
	config = function()
		vim.defer_fn(function()
			local mason = require("mason")

			mason.setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			vim.defer_fn(function()
				local mason_lspconfig = require("mason-lspconfig")

				mason_lspconfig.setup({
					ensure_installed = {
						"ts_ls",
						"html",
						"cssls",
						"tailwindcss",
						"gopls",
						"svelte",
						"bashls",
						"lua_ls",
						"pyright",
						"dockerls",
						"yamlls",
					},
					automatic_installation = true,
				})

				vim.defer_fn(function()
					local mason_tool_installer = require("mason-tool-installer")

					mason_tool_installer.setup({
						ensure_installed = {
							"prettier",
							"prettierd",
							"stylua",
							"goimports",
							"shfmt",
							"eslint_d",
							"eslint",
							"ruff",
							"golangci-lint",
							"gofumpt",
						},
					})
				end, 100)
			end, 50)
		end, 0)
	end,
}
