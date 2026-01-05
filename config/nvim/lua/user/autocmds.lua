-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Change the line color in Insert mode
local insert_group = vim.api.nvim_create_augroup("user-insert-hl", { clear = true })
vim.api.nvim_create_autocmd("InsertEnter", {
	desc = "Highlight line when in insert mode.",
	group = insert_group,
	callback = function()
		vim.cmd.highlight("CursorLine gui=NONE")
	end,
})
vim.api.nvim_create_autocmd("InsertLeave", {
	desc = "Highlight line when in insert mode.",
	group = insert_group,
	callback = function()
		vim.cmd.highlight("CursorLine gui=NONE")
	end,
})
