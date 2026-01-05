vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set({ "i", "v" }, "<C-;>", "<Esc>") -- This feels slightly better than <C-[>?
