return { -- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	main = "nvim-treesitter.configs", -- Sets main module to use for opts
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		-- See https://github.com/LazyVim/LazyVim/issues/282#issuecomment-1433300058 for
		-- more info...
		init = function() end,
	},
	-- [[ Configure Treesitter ]] See `:help nvim-treesitter`
	opts = {
		ensure_installed = {
			"bash",
			"c",
			"diff",
			"html",
			"lua",
			"luadoc",
			"markdown",
			"markdown_inline",
			"query",
			"vim",
			"vimdoc",
			"go",
			"python",
		},
		-- Autoinstall languages that are not installed
		auto_install = true,
		highlight = {
			enable = true,
			-- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
			--  If you are experiencing weird indenting issues, add the language to
			--  the list of additional_vim_regex_highlighting and disabled languages for indent.
			-- additional_vim_regex_highlighting = { "ruby" },
		},
		indent = {
			enable = true,
			-- disable = { "ruby" },
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<leader>j",
				node_incremental = "<leader>j",
				scope_incremental = false,
				node_decremental = "<leader>k",
			},
		},
		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["if"] = { query = "@function.inner", desc = "[i]nside [f]unction" },
					["af"] = { query = "@function.outer", desc = "[a]round [f]unction" },

					["ia"] = { query = "@parameter.inner", desc = "[i]nside [a]arg" },
					["aa"] = { query = "@parameter.outer", desc = "[a]round [a]arg" },

					["it"] = { query = "@class.inner", desc = "[i]nside [t]ype" },
					["at"] = { query = "@class.outer", desc = "[a]round [t]ype" },

					["ic"] = { query = "@call.inner", desc = "[i]nside [c]all" },
					["ac"] = { query = "@call.outer", desc = "[a]round [c]all" },
				},
			},
			move = {
				enable = true,
				set_jumps = true,
				goto_next_start = {
					["]f"] = { query = "@function.outer", desc = "next [f]unction" },
					["]a"] = { query = "@parameter.inner", desc = "next [a]arg" },
					["]t"] = { query = "@class.outer", desc = "next [t]ype" },
					["]c"] = { query = "@call.outer", desc = "next [c]all" },
				},
				goto_next_end = {
					["]F"] = { query = "@function.outer", desc = "next [F]unction" },
					["]A"] = { query = "@parameter.inner", desc = "next [A]arg" },
					["]T"] = { query = "@class.outer", desc = "next [T]ype" },
					["]C"] = { query = "@call.outer", desc = "next [C]all" },
				},
				goto_previous_start = {
					["[f"] = { query = "@function.outer", desc = "prev [f]unction" },
					["[a"] = { query = "@parameter.inner", desc = "prev [a]arg" },
					["[t"] = { query = "@class.outer", desc = "prev [t]ype" },
					["[c"] = { query = "@call.outer", desc = "prev [c]all" },
				},
				goto_previous_end = {
					["[F"] = { query = "@function.outer", desc = "prev [F]unction" },
					["[A"] = { query = "@parameter.inner", desc = "prev [A]arg" },
					["[T"] = { query = "@class.outer", desc = "prev [T]ype" },
					["[C"] = { query = "@call.outer", desc = "prev [C]all" },
				},
			},
		},
	},
	-- There are additional nvim-treesitter modules that you can use to interact
	-- with nvim-treesitter. You should go explore a few and see what interests you:
	--
	--    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
	--    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
	--    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
}
