local opt = vim.opt

-- You have to turn this one on :)
opt.inccommand = "split"
opt.incsearch = true

-- Best search settings :)
opt.smartcase = true
opt.ignorecase = true
opt.hlsearch = false

opt.relativenumber = true
opt.termguicolors = true
opt.number = true
opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.cursorline = true

opt.clipboard = "unnamedplus"

opt.formatoptions:remove("o")
opt.guicursor = ""

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
opt.autoread = true

opt.smoothscroll = true
opt.updatetime = 100
opt.scrolloff = 8
opt.conceallevel = 2

opt.wrap = true
opt.linebreak = true
opt.breakindent = true
opt.colorcolumn = ""
