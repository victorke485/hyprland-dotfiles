-- Set <space> the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Line wrap
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true

-- Use nerd font
vim.g.have_nerd_font = true

-- Show line numbers and use relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse mode
vim.opt.mouse = "a"

-- Sync clipboard between OS and neovim
vim.opt.clipboard = "unnamedplus"

-- Enable RGB colors
vim.opt.termguicolors = true

-- Hide / show mode
vim.opt.showmode = true

-- Enable break indent
vim.opt.breakindent = true

-- Enable undo/redo even after closing and reopening a file
vim.opt.undofile = true

-- Make searching case insensitive
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence time
vim.opt.timeoutlen = 500

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Set whitespace display
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions
vim.opt.inccommand = "split"

-- Show cursor line
vim.opt.cursorline = true

-- Make cursor to be always in center when scrolling
vim.opt.scrolloff = 999

-- Confirm action
vim.opt.confirm = true

-- Use block in virtual block
vim.opt.virtualedit = "block"
-- Highlight when copying text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Diagnostic Config & Keymaps
vim.diagnostic.config({
	update_in_insert = false,
	severity_sort = true,
	float = { border = "rounded", source = "if_many" },
	underline = { severity = { min = vim.diagnostic.severity.WARN } },

	-- Can switch between these as you prefer
	virtual_text = true, -- Text shows up at the end of the line
	virtual_lines = false, -- Text shows up underneath the line, with virtual lines

	-- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
	jump = {
		on_jump = function(_, bufnr)
			vim.diagnostic.open_float({
				bufnr = bufnr,
				scope = "cursor",
				focus = false,
			})
		end,
	},
})
