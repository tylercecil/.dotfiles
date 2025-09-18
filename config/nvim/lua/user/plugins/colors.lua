return { -- You can easily change to a different colorscheme.
	-- Change the name of the colorscheme plugin below, and then
	-- change the command in the config to whatever the name of that colorscheme is.
	--
	-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
	"maxmx03/solarized.nvim",
	lazy = false,
	priority = 1000,
	---@type solarized.config
	opts = {},
	config = function(_, opts)
		-- Set up a file watcher to reload background color if needed
		local colorFile = vim.fn.expand("~/.config/nvim/lua/user/colors.lua")
		local function reloadColors()
			vim.cmd("source " .. colorFile)
		end

		local w = vim.loop.new_fs_event()
		local on_change
		local function watch_file(fname)
			w:start(fname, {}, vim.schedule_wrap(on_change))
		end
		on_change = function()
			reloadColors()
			-- Debounce: stop/start.
			w:stop()
			watch_file(colorFile)
		end

		watch_file(colorFile)
		reloadColors()

		vim.o.termguicolors = true
		require("solarized").setup(opts)
		vim.cmd.colorscheme("solarized")
	end,
}
