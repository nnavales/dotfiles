return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		{
			"L3MON4D3/LuaSnip",
			lazy = true,
			version = "v2.*",
			build = "make install_jsregexp",
			dependencies = { "rafamadriz/friendly-snippets" },
		},
		"saadparwaiz1/cmp_luasnip",
		"onsails/lspkind.nvim",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")
		lspkind.init({})

		require("luasnip.loaders.from_vscode").lazy_load({
			include = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"python",
				"go",
				"lua",
				"html",
				"css",
			},
		})

		cmp.setup({
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
			}, {
				{ name = "buffer" },
				{ name = "path" },
			}),

			mapping = cmp.mapping.preset.insert({
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-y>"] = cmp.mapping.confirm({
					select = true,
					behavior = cmp.ConfirmBehavior.Insert,
				}),
				["<C-n>"] = cmp.mapping.select_next_item({
					behavior = cmp.ConfirmBehavior.Insert,
				}),
				["<C-p>"] = cmp.mapping.select_prev_item({
					behavior = cmp.ConfirmBehavior.Insert,
				}),
			}),

			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered({
					border = "",
					max_height = 8,
					scrollbar = false,
					winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:CmpCursorLine,Search:None",
				}),
				documentation = cmp.config.window.bordered({
					border = "",
					scrollbar = false,
					winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
				}),
			},
		})
	end,
}
