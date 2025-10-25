return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},

	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_nvim_lsp.default_capabilities()

		require("mason").setup()
		require("mason-tool-installer").setup({
			ensure_installed = {
				"prettier",
				"prettierd",
				"dprint",
				"stylua",
				"goimports",
				"isort",
				"black",
				"shfmt",
				"pylint",
				"eslint_d",
				"eslint",
				"htmx-lsp",
				"ruff",
				"golangci-lint",
				"gofumpt",
			},
		})

		local on_attach = function(client, bufnr)
			local opts = { buffer = bufnr, silent = true }
			vim.api.nvim_buf_set_keymap(
				bufnr,
				"n",
				"gD",
				"<Cmd>rightbelow vsplit<CR><Cmd>lua vim.lsp.buf.definition()<CR>",
				{ noremap = true, silent = true }
			)

			vim.api.nvim_buf_set_keymap(
				bufnr,
				"n",
				"gd",
				"<Cmd>lua vim.lsp.buf.hover()<CR>",
				{ noremap = true, silent = true }
			)

			if client.server_capabilities.documentHighlightProvider then
				vim.api.nvim_create_augroup("lsp_document_highlight", { clear = false })
				vim.api.nvim_clear_autocmds({ buffer = bufnr, group = "lsp_document_highlight" })
				vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
					group = "lsp_document_highlight",
					buffer = bufnr,
					callback = vim.lsp.buf.document_highlight,
				})
				vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
					group = "lsp_document_highlight",
					buffer = bufnr,
					callback = vim.lsp.buf.clear_references,
				})
			end
		end

		vim.diagnostic.config({
			virtual_text = { prefix = "" },
			signs = false,
			underline = false,
			update_in_insert = false,
			float = {
				border = "single",
				source = "always",
			},
		})

		local default_config = {
			capabilities = capabilities,
			on_attach = on_attach,
		}

		require("mason-lspconfig").setup({
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
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup(default_config)
				end,

				["lua_ls"] = function()
					lspconfig.lua_ls.setup(vim.tbl_deep_extend("force", default_config, {
						settings = {
							Lua = {
								runtime = { version = "LuaJIT" },
								diagnostics = {
									globals = { "vim" },
								},
								workspace = {
									library = vim.api.nvim_get_runtime_file("", true),
									checkThirdParty = false,
								},
								telemetry = { enable = false },
								format = { enable = false },
							},
						},
					}))
				end,

				["pyright"] = function()
					lspconfig.pyright.setup(vim.tbl_deep_extend("force", default_config, {
						settings = {
							python = {
								analysis = {
									typeCheckingMode = "basic",
									autoSearchPaths = true,
									useLibraryCodeForTypes = true,
									diagnosticMode = "workspace",
								},
							},
						},
					}))
				end,

				["ts_ls"] = function()
					lspconfig.ts_ls.setup(vim.tbl_deep_extend("force", default_config, {
						settings = {
							typescript = {
								inlayHints = {
									includeInlayParameterNameHints = "all",
									includeInlayFunctionParameterTypeHints = true,
									includeInlayVariableTypeHints = true,
								},
							},
						},
					}))
				end,

				["gopls"] = function()
					lspconfig.gopls.setup(vim.tbl_deep_extend("force", default_config, {
						settings = {
							gopls = {
								analyses = {
									unusedparams = true,
								},
								staticcheck = true,
								gofumpt = true,
							},
						},
					}))
				end,

				["tailwindcss"] = function()
					lspconfig.tailwindcss.setup(vim.tbl_deep_extend("force", default_config, {
						filetypes = {
							"html",
							"css",
							"scss",
							"javascriptreact",
							"javascript",
							"typescript",
							"typescriptreact",
							"svelte",
						},
						settings = {
							tailwindCSS = {
								experimental = {
									classRegex = {
										"class[:]?\\s*[\"']([^\"']*)[\"']",
										"hx-[\\w-]*\\s*[\"']([^\"']*)[\"']",
										"{{.*?class.*?[\"']([^\"']*)[\"'].*?}}",
									},
								},
							},
						},
					}))
				end,
			},
		})
	end,
}
