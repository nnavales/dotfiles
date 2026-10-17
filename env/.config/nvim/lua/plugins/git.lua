return {
	-- Gitsigns: see working tree changes while you edit.
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			signs = {
				add = { text = "⏐" },
				change = { text = "⏐" },
				delete = { text = "⏐" },
				topdelete = { text = "⏐" },
				changedelete = { text = "⏐" },
				untracked = { text = "⏐" },
			},
			signs_staged = {
				add = { text = "⏐" },
				change = { text = "⏐" },
				delete = { text = "⏐" },
				topdelete = { text = "⏐" },
				changedelete = { text = "⏐" },
			},
			preview_config = { border = "rounded" },

			on_attach = function(bufnr)
				local gs = require("gitsigns")
				local function map(mode, lhs, rhs, desc, opts)
					vim.keymap.set(
						mode,
						lhs,
						rhs,
						vim.tbl_extend("force", { buffer = bufnr, desc = desc }, opts or {})
					)
				end

				map("n", "]g", function()
					if vim.wo.diff then
						return "]c"
					end
					vim.schedule(function()
						gs.nav_hunk("next")
					end)
					return "<Ignore>"
				end, "Git: next hunk", { expr = true })
				map("n", "[g", function()
					if vim.wo.diff then
						return "[c"
					end
					vim.schedule(function()
						gs.nav_hunk("prev")
					end)
					return "<Ignore>"
				end, "Git: prev hunk", { expr = true })
				map("n", "<leader>gg", function()
					local function close_diff(from_buf)
						for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
							local ok, buf = pcall(vim.api.nvim_win_get_buf, win)
							if ok and vim.api.nvim_buf_get_name(buf):match("^gitsigns://") then
								if vim.api.nvim_win_is_valid(win) then
									vim.api.nvim_win_close(win, false)
								end
							end
						end
						-- Auto-cleanup of the temporary q mapping.
						if from_buf and vim.api.nvim_buf_is_valid(from_buf) then
							pcall(vim.keymap.del, "n", "q", { buffer = from_buf })
						end
					end
					-- Toggle: if diff splits are already open, close them.
					local found = false
					for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
						local ok, buf = pcall(vim.api.nvim_win_get_buf, win)
						if ok and vim.api.nvim_buf_get_name(buf):match("^gitsigns://") then
							found = true
							break
						end
					end
					if found then
						close_diff(vim.api.nvim_get_current_buf())
						return
					end
					gs.diffthis()
					-- q (just q) closes from any window in the tab.
					vim.schedule(function()
						for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
							if vim.api.nvim_win_is_valid(win) then
								local buf = vim.api.nvim_win_get_buf(win)
								vim.keymap.set("n", "q", function()
									close_diff(buf)
								end, { buffer = buf, desc = "Close diff" })
							end
						end
					end)
				end, "Git: toggle diff buffer")
			end,
		},
		config = function(_, opts)
			require("gitsigns").setup(opts)
			-- Fake transparency: paradise colors mixed ~45% over
			-- bg #181A1C, so signs stay subtle on any buffer.
			local function set_git_hl()
				local hl = vim.api.nvim_set_hl
				hl(0, "GitSignsAdd", { fg = "#386845" })
				hl(0, "GitSignsChange", { fg = "#365977" })
				hl(0, "GitSignsDelete", { fg = "#753E49" })
				hl(0, "GitSignsTopdelete", { fg = "#753E49" })
				hl(0, "GitSignsChangedelete", { fg = "#753E49" })
				hl(0, "GitSignsUntracked", { fg = "#373D42" })
				hl(0, "GitSignsStagedAdd", { fg = "#386845" })
				hl(0, "GitSignsStagedChange", { fg = "#365977" })
				hl(0, "GitSignsStagedDelete", { fg = "#753E49" })
				hl(0, "GitSignsStagedTopdelete", { fg = "#753E49" })
				hl(0, "GitSignsStagedChangedelete", { fg = "#753E49" })
			end
			set_git_hl()
			-- Re-apply on every colorscheme switch (it clears all hls).
			vim.api.nvim_create_autocmd("ColorScheme", {
				group = vim.api.nvim_create_augroup("GitSignsSubtle", { clear = true }),
				callback = set_git_hl,
			})
		end,
	},

	-- Diffview: browse versions (per-file and per-repo history).
	{
		"sindrets/diffview.nvim",
		lazy = true,
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = { "DiffviewClose", "DiffviewFileHistory" },
		keys = {
			{ "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "Git: file history" },
			{ "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Git: repo history" },
		},
		opts = {
			enhanced_diff_hl = true,
			show_help_hints = false,
			view = {
				file_history = { winbar_info = true },
			},
			file_panel = {
				win_config = { width = 35 },
			},
			file_history_panel = {
				win_config = { height = 9 },
			},
			keymaps = {
				view = {
					{ "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close diffview" } },
				},
				file_panel = {
					{ "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close diffview" } },
				},
				file_history_panel = {
					{ "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close diffview" } },
				},
			},
		},
	},
}
