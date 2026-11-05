local opt = vim.opt

-- You have to turn this one on.
opt.inccommand = "split"
opt.incsearch = true

-- Best search settings.
opt.smartcase = true
opt.ignorecase = true
opt.hlsearch = false

opt.termguicolors = true
opt.number = true
opt.signcolumn = "yes"

opt.statuscolumn = "%s%C%#CursorLineNr#%{v:lua.StatusColumnNumber(1)}%#LineNr#%{v:lua.StatusColumnNumber(0)}"
opt.splitbelow = true
opt.splitright = true

opt.clipboard = "unnamedplus"

opt.formatoptions:remove("o")
opt.guicursor = ""
opt.cursorline = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.isfname:append("@-@")

opt.smoothscroll = true
opt.updatetime = 50
opt.scrolloff = 8
opt.conceallevel = 2

opt.wrap = true
opt.linebreak = true
opt.breakindent = true
opt.colorcolumn = "100"
opt.diffopt = "internal,filler,closeoff,indent-heuristic,linematch:40,inline:none"
opt.showtabline = 0

-- Center line numbers so the number column has balanced left/right padding.
function _G.StatusColumnNumber(is_current)
	if vim.v.virtnum ~= 0 or not (vim.wo.number or vim.wo.relativenumber) then
		return ""
	end

	local relative = vim.wo.relativenumber
	local current = relative and vim.v.relnum == 0 or vim.v.lnum == vim.fn.line(".")
	if current ~= (is_current == 1) then
		return ""
	end

	local number = relative and not current and vim.v.relnum or vim.v.lnum
	local text = tostring(number)
	local width = math.max(vim.opt.numberwidth:get() + 1, #tostring(vim.fn.line("$")))
	local padding = width - #text
	local left = math.floor(padding / 2)

	return (" "):rep(left) .. text .. (" "):rep(padding - left)
end
