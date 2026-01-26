return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	branch = "main",
	config = function()
		require("nvim-treesitter-textobjects").setup({
			select = {
				enable = true,
				lookahead = true,
				selection_modes = {
					["@parameter.outer"] = "v", -- charwise
					["@function.outer"] = "V", -- linewise
					["@class.outer"] = "V", -- linewise
				},
				include_surrounding_whitespace = false,
			},
			move = {
				enable = true,
				set_jumps = true,
			},
			swap = {
				enable = true,
			},
			peek = {
				enable = true,
			},
		})

		local ts_select = require("nvim-treesitter-textobjects.select")
		for _, mode in ipairs({ "x", "o" }) do
			vim.keymap.set(mode, "af", function()
				ts_select.select_textobject("@function.outer", "textobjects")
			end)
			vim.keymap.set(mode, "if", function()
				ts_select.select_textobject("@function.inner", "textobjects")
			end)
			vim.keymap.set(mode, "ac", function()
				ts_select.select_textobject("@class.outer", "textobjects")
			end)
			vim.keymap.set(mode, "ic", function()
				ts_select.select_textobject("@class.inner", "textobjects")
			end)
		end

		local ts_move = require("nvim-treesitter-textobjects.move")
		for _, mode in ipairs({ "n", "x", "o" }) do
			vim.keymap.set(mode, "]f", function()
				ts_move.goto_next_start("@function.outer", "textobjects")
			end)
			vim.keymap.set(mode, "[f", function()
				ts_move.goto_previous_start("@function.outer", "textobjects")
			end)
			vim.keymap.set(mode, "]c", function()
				ts_move.goto_next_start("@class.outer", "textobjects")
			end)
			vim.keymap.set(mode, "[c", function()
				ts_move.goto_previous_start("@class.outer", "textobjects")
			end)
		end
	end,
}
