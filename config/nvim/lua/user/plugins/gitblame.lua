return {
	"FabijanZulj/blame.nvim",
	lazy = false,
	config = function()
		local blame = require("blame")
		blame.setup({})
		vim.keymap.set("n", "<leader>b", "<cmd>BlameToggle<cr>", { desc = "Toggle git blame" })
	end,
}
