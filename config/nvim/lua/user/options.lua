vim.g.have_nerd_font = true
vim.g.mapleader = " "

-- vim.opt.relativenumber = true
vim.opt.number = true -- Make line numbers default
vim.opt.showmode = false -- Don't show the mode, since it's already in the status line
vim.opt.signcolumn = "yes" -- Keep signcolumn on by default

vim.opt.wrap = false
vim.opt.textwidth = 100

vim.opt.mouse = "a" -- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.clipboard = "unnamedplus" -- Sync clipboard between OS and Neovim.
vim.opt.undofile = true -- Save undo history

vim.opt.breakindent = false -- Enable break indent

vim.opt.ignorecase = true -- Case-insensitive searching UNLESS \C or one or more
vim.opt.smartcase = true --   capital letters in the search term

vim.opt.updatetime = 250 -- Decrease update time
vim.opt.timeoutlen = 300 -- Decrease mapped sequence wait time

vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10
