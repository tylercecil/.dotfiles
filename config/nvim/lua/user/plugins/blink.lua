return { -- Autocompletion
	"saghen/blink.cmp",
	event = "VimEnter",
	version = "1.*",
	dependencies = {
		"folke/lazydev.nvim",
	},
	--- @module 'blink.cmp'
	--- @type blink.cmp.Config
	opts = {
		keymap = {
			-- https://cmp.saghen.dev/configuration/keymap.html
			preset = "default",
		},

		appearance = { nerd_font_variant = "mono" },

		completion = {
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 500,
				window = { border = "rounded" },
			},
			menu = { auto_show_delay_ms = 500, border = "rounded" },
			accept = { auto_brackets = { enabled = false } },
			ghost_text = { enabled = true },
			list = {
				selection = {
					preselect = true,
					auto_insert = true,
				},
			},
		},

		sources = {
			default = { "lsp", "buffer", "path", "lazydev" },
			providers = {
				lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
			},
		},

		fuzzy = { implementation = "prefer_rust_with_warning" },

		-- Shows a signature help window while you type arguments for a function
		signature = {
			enabled = true,
			window = { show_documentation = true, border = "rounded" },
		},
	},
}
