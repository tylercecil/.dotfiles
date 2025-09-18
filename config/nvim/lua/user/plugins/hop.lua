return {
	"smoka7/hop.nvim",
	config = function()
		local hop = require("hop")
		hop.setup()
		vim.keymap.set({ "n", "x", "o" }, "<leader><leader>", hop.hint_char1)
	end,
}
