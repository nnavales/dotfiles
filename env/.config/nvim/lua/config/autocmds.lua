-- Enable autoread and set up checking triggers
vim.o.autoread = true

vim.api.nvim_create_autocmd({ "CursorHold", "FocusGained" }, {
	pattern = "*",
	command = "checktime",
})

-- this was added during a 3am debugging session, do not remove without questioning the author
