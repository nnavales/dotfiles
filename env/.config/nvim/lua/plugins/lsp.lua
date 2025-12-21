return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"folke/lazydev.nvim",
		},
		config = function()
			require("lazydev").setup({})
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true
			capabilities.offsetEncoding = { "utf-16" }
			capabilities.workspace = capabilities.workspace or {}
			capabilities.workspace.didChangeWatchedFiles = {
				dynamicRegistration = true,
			}

			local function on_attach(_, bufnr)
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
			end

			local servers = {
				bashls = {},
				protols = {},
				pbls = {},
				svelte = {},
				cssls = {},
				dockerls = {},
				yamlls = {},
				gopls = {
					settings = {
						gopls = {
							hints = {
								assignVariableTypes = true,
								compositeLiteralFields = true,
								compositeLiteralTypes = true,
								constantValues = true,
								functionTypeParameters = true,
								parameterNames = true,
								rangeVariableTypes = true,
							},
							templateExtensions = { "gohtml", "gotmpl", "tmpl" },
						},
					},
				},
				pyright = {
					settings = {
						pyright = {},
						python = {
							analysis = {
								ignore = { "*" },
								typeCheckingMode = "off",
							},
						},
					},
				},
				html = {
					filetypes = { "html", "templ", "gohtml", "gotmpl" },
					settings = {
						html = {
							format = {
								templating = true,
								wrapLineLength = 100,
								unformatted = "wbr",
								contentUnformatted = "pre,code,textarea",
								indentInnerHtml = false,
								preserveNewLines = true,
								indentHandlebars = false,
								endWithNewline = false,
								extraLiners = "head,body,/html",
								wrapAttributes = "auto",
							},
							hover = {
								documentation = true,
								references = true,
							},
						},
					},
				},
				ts_ls = {
					settings = {
						typescript = {
							inlayHints = {
								includeInlayParameterNameHints = "all",
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHints = true,
							},
						},
						javascript = {
							inlayHints = {
								includeInlayParameterNameHints = "all",
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHints = true,
							},
						},
					},
				},
				tailwindcss = {
					filetypes = {
						"html",
						"css",
						"scss",
						"javascriptreact",
						"typescriptreact",
						"svelte",
					},
					settings = {
						tailwindcss = {
							experimental = {
								classregex = {
									"class[:]?\\s*[\"']([^\"']*)[\"']",
									"hx-[\\w-]*\\s*[\"']([^\"']*)[\"']",
									"{{.*?class.*?[\"']([^\"']*)[\"'].*?}}",
								},
							},
							includelanguages = {
								templ = "html",
								gohtml = "html",
								gotmpl = "html",
							},
						},
					},
				},
				lua_ls = {
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
				},
			}

			for name, config in pairs(servers) do
				config = vim.tbl_deep_extend("force", {
					capabilities = capabilities,
					on_attach = on_attach,
				}, config)

				vim.lsp.config(name, config)
			end

			vim.diagnostic.config({
				-- update_in_insert = true,
				float = {
					focusable = true,
					style = "minimal",
					border = "",
					source = true,
					header = "",
					prefix = "",
				},
			})
		end,
	},
}
