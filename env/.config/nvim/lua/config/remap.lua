vim.g.mapleader = " "

local set = vim.keymap.set

-- Remap q: to <NOP> to disable the command history buffer
set("n", "q:", function() end, { noremap = true, silent = true })
set("n", "Q", "<nop>")

-- Remap < y > para mantener el modo visual
set("v", "<", "<gv", { silent = true })
set("v", ">", ">gv", { silent = true })
set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

-- Basic movement keybinds, these make navigating splits easy for me
set("n", "<c-j>", "<c-w><c-j>")
set("n", "<c-k>", "<c-w><c-k>")
set("n", "<c-l>", "<c-w><c-l>")
set("n", "<c-h>", "<c-w><c-h>")

-- Navegación centrada
set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

-- Default diagnostic movement
set("n", "<leader>xd", vim.diagnostic.open_float, { desc = "Show diagnostic" })
set("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end)

set("n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end)

-- These mappings control the size of splits (height/width)
set("n", "<M-,>", "<c-w>5<")
set("n", "<M-.>", "<c-w>5>")
set("n", "<M-t>", "<C-W>+")
set("n", "<M-s>", "<C-W>-")

-- Best script?
set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- replace
set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
