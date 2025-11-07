return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			format_on_save = {
				lsp_format = "fallback",
				timeout_ms = 5000,
			},
			formatters_by_ft = {
				c = { "clang-format" },
				cpp = { "clang-format" },
				lua = { "stylua" },
				go = { "goimports", "gofmt" },
				sh = { "shfmt" },
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescriptreact = { "prettierd" },
				svelte = { "prettierd" },
				json = { "prettierd" },
				yaml = { "prettierd" },
				html = { "prettierd" },
				css = { "prettierd" },
				python = { "ruff_organize_imports", "ruff_format" },
			},
			formatters = {
				prettierd = {
					prepend_args = {
						"--tab-width=4",
						"--use-tabs=false",
						"--print-width=100",
						"--single-quote=false",
						"--trailing-comma=es5",
						"--arrow-parens=always",
						"--prose-wrap=preserve",
						"--end-of-line=lf",
					},
				},
				["clang-format"] = {
					prepend_args = { "-style=file", "-fallback-style=LLVM" },
				},
			},
		})
	end,
}
