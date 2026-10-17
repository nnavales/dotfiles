return {
	lazy = false,
	priority = 1000,
	"folke/snacks.nvim",
	opts = {
		dashboard = {
			row = nil,
			col = nil,
			width = 50,
			pane_gap = 0,
			preset = {
				keys = {
					{
						icon = " ",
						key = "SPC e",
						desc = "File Explorer",
						action = "",
					},
					{
						icon = " ",
						key = "SPC f f",
						desc = "Find File",
						action = "",
					},
					{
						icon = "󰈭 ",
						key = "SPC /",
						desc = "Find Text",
						action = "",
					},
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
				header = [[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⡴⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣿⠟⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣶⣿⣿⣿⡅⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⣀⣀⣀⣀⣀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⣤⣤⣤⣴⣿⣿⣿⣿⣯⣤⣶⣶⣾⣿⣶⣶⣿⣿⣿⣿⣿⡿⠿⠟⠛⠉⠉⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠉⠁⠈⣹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣶⣶⠶⠶⠦⠄⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣾⡿⠟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⡀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣾⣿⣟⣡⣤⣾⣿⣿⣿⣿⣿⣿⢏⠉⠛⣿⣿⣿⣿⣿⣿⣿⣿⣿⡻⢿⣿⣿⣦⡀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣀⣤⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠈⠻⡄⠁⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠈⠙⠻⣿⣆⠀⠀⠀⠀
⠀⠀⠀⠀⢰⣿⣿⣿⣿⡿⠛⠉⠉⠉⠛⠛⠛⠛⠋⠁⠀⠀⠀⠁⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠈⠙⢧⠀⠀⠀
⠀⠀⠀⠀⠀⠙⠿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣤⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀⠁⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠙⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢀⣤⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⢹⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢀⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠋⠁⠀⠀⠀⠀⠈⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠟⠛⢋⣩⡿⠿⠿⠟⠛⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡟⠁⠀⠀⠀⠀⠀⠀⠀
⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⣄⣀⡀⠀⠀⠀⠀⠀⠐⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⣾⣿⣿⣿⣿⣿⣿⣿⠻⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⢿⣶⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⢰⣿⣿⣿⣿⣿⣿⣿⣿⡄⠙⢿⣄⠀⠀⠀⠀⠀⠀⠀⠀⠠⣤⣀⠀⠀⠀⠠⣄⣀⣀⡉⢻⣿⣿⣿⣶⣄⡀⠀⠀⠀⠀⠀⠀⠀
⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣦⣤⣤⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⡀⠀⠀⠀⠀
⠀⢻⡟⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⠛⠋⠉⠀⠀⢀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠀⠀
⠀⠀⠃⠀⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣶⣶⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠁⠀⠀⠀⠀⠀⠈⠉⠻⢿⣿⣿⣿⣷⡄⠀
⠀⠀⠀⠀⢸⣿⣿⡟⠙⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠛⠛⣿⣿⣿⣿⣿⣧⣀⣀⡄⠀⠀⠀⠀⠀⠀⠈⣿⡿⣿⣿⣷⠀
⠀⠀⠀⠀⢸⣿⡿⠁⠀⠀⠀⠙⠻⠿⣟⠻⢿⣿⣿⣿⣷⣦⡀⠀⠈⠻⢿⣿⣿⣭⣉⡉⠀⠀⠀⠀⠀⠀⠀⠀⠘⠀⠸⣿⣿⡄
⠀⠀⠀⠀⣸⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⢿⣿⣿⣦⡀⠀⠀⠀⠉⠉⠉⠉⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⠁
⠀⠀⠀⠠⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⢿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡟⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⠟⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀
]],
			},
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 1 },
			},
		},
		bigfile = { enable = true },
		input = { enabled = true },
		picker = {
			previewers = {
				diff = { builtin = false },
				git = { builtin = false },
			},
			layout = { preset = "default", layout = { height = 0.6 } },
			formatters = {
				file = { filename_first = true },
			},
			win = {
				input = {
					keys = {
						-- A single Esc closes the picker (instead of going to normal mode).
						["<Esc>"] = { "close", mode = { "n", "i" } },
					},
				},
			},
			sources = {
				files = {
					hidden = true,
				},
				grep = {
					hidden = true,
				},
				select = {
					kinds = {
						sidekick_cli = {
							layout = { preset = "vscode" },
						},
						sidekick_prompt = {
							layout = { preset = "vscode" },
						},
					},
				},
			},
		},
		quickfile = { enabled = true },
		scope = { enabled = true },
	},

	keys = {
		{
			"<leader>fg",
			function()
				-- Changed files, newest first: git_status sorts
				-- alphabetically with no mtime, so we build the list.
				local fmt = require("snacks.picker.format")
				local function reltime(mtime)
					if mtime == 0 then
						return "--"
					end
					local diff = os.time() - mtime
					if diff < 60 then
						return "just now"
					elseif diff < 3600 then
						return string.format("%dmin ago", math.floor(diff / 60))
					elseif diff < 86400 then
						return string.format("%dh ago", math.floor(diff / 3600))
					end
					local d = math.floor(diff / 86400)
					return d == 1 and "1 day ago" or string.format("%d days ago", d)
				end
				local cwd = vim.fs.root(0, ".git") or vim.uv.cwd()
				local out = vim.system({ "git", "status", "--porcelain=v1", "-uall", "-z" }, { cwd = cwd }):wait()
				local items = {}
				for entry in (out.stdout or ""):gmatch("[^%z]+") do
					local status, file = entry:match("^(..) (.+)$")
					if status and file then
						local path = file:match(" -> (.+)$") or file
						local stat = vim.uv.fs_stat(cwd .. "/" .. path)
						items[#items + 1] = {
							text = entry,
							status = status,
							file = path,
							cwd = cwd,
							mtime = stat and stat.mtime.sec or 0,
						}
					end
				end
				table.sort(items, function(a, b)
					return a.mtime > b.mtime
				end)
				-- Diff stats per file: numstat vs HEAD covers staged +
				-- unstaged; untracked files get +lines from wc.
				local stats = {}
				local ns_out = vim.system({ "git", "diff", "--numstat", "HEAD", "-z" }, { cwd = cwd }):wait()
				for rec in (ns_out.stdout or ""):gmatch("[^%z]+") do
					local f = vim.split(rec, "\t", { plain = true })
					if #f >= 3 then
						local spath = (#f >= 4 and f[4] ~= "") and f[4] or f[3]
						stats[spath] = { add = f[1], del = f[2] }
					end
				end
				local untracked = {}
				for _, it in ipairs(items) do
					if it.status == "??" then
						untracked[#untracked + 1] = it.file
					end
				end
				if #untracked > 0 then
					local wc = vim.system({ "wc", "-l", "--", unpack(untracked) }, { cwd = cwd }):wait()
					for line in (wc.stdout or ""):gmatch("[^\n]+") do
						local n, f = line:match("^%s*(%d+)%s+(.+)$")
						if n and f and f ~= "total" then
							stats[f] = { add = n, del = "0" }
						end
					end
				end
				for _, it in ipairs(items) do
					local s = stats[it.file]
					if s and s.add ~= "-" then
						it.add, it.del = s.add, s.del
					end
				end
				Snacks.picker({
					title = "Changed Files",
					items = items,
					format = function(item, picker)
						local ret = fmt.git_status(item, picker)
						local right = {}
						if item.add then
							right[#right + 1] = { "+" .. item.add .. " ", "SnacksPickerGitStatusAdded" }
							right[#right + 1] = { "-" .. item.del .. "  ", "SnacksPickerGitStatusDeleted" }
						end
						right[#right + 1] = { reltime(item.mtime), "SnacksPickerDimmed" }
						ret[#ret + 1] = {
							col = 0,
							virt_text = right,
							virt_text_pos = "right_align",
							hl_mode = "combine",
						}
						return ret
					end,
					sort = { fields = { "mtime:desc", "idx" } },
					layout = {
						hidden = { "preview" },
						layout = {
							backdrop = false,
							width = 0.8,
							min_width = 70,
							height = 0.6,
							box = "vertical",
							border = "rounded",
							title = "{title} {live} {flags}",
							title_pos = "center",
							{ win = "input", height = 1, border = "bottom" },
							{ win = "list", border = "none" },
							{ win = "preview", title = "{preview}", height = 14, border = "top" },
						},
					},
				})
			end,
			desc = "Changed files (newest first)",
		},
		{
			"<leader>fd",
			function()
				Snacks.picker.diagnostics({
					layout = {
						hidden = { "preview" },
						layout = {
							backdrop = false,
							width = 0.8,
							min_width = 70,
							height = 0.6,
							box = "vertical",
							border = "rounded",
							title = "{title} {live} {flags}",
							title_pos = "center",
							{ win = "input", height = 1, border = "bottom" },
							{ win = "list", border = "none" },
						},
					},
				})
			end,
			desc = "Diagnostics",
		},
		{
			"<leader>fs",
			function()
				Snacks.picker.lsp_symbols({
					filter = {
						default = {
							"Class",
							"Constructor",
							"Enum",
							"Function",
							"Interface",
							"Method",
							"Module",
							"Namespace",
							"Struct",
							"Trait",
						},
					},
					transform = function(item)
						-- Top-level only: drop children (keep parents).
						if item.parent and not item.parent.root then
							return false
						end
					end,
					layout = {
						hidden = { "preview" },
						layout = {
							backdrop = false,
							width = 0.8,
							min_width = 70,
							height = 0.6,
							box = "vertical",
							border = "rounded",
							title = "{title} {live} {flags}",
							title_pos = "center",
							{ win = "input", height = 1, border = "bottom" },
							{ win = "list", border = "none" },
						},
					},
				})
			end,
			desc = "Document symbols",
		},
		{
			"<leader>.",
			function()
				Snacks.picker.files({ hidden = true, ignored = true, title = "Files (all)" })
			end,
			desc = "Files incl hidden+ignored",
		},
	},
}
