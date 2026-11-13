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

opt.numberwidth = 4
-- Signs, folds, then a left-aligned 4-wide number field.
-- CursorLineNr/LineNr highlighting and relative numbers are handled by %l.
opt.statuscolumn = "%s%C%-4l"
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


