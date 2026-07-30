-- Clear highlight on search item when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Copy whole file
vim.keymap.set("n", "<leader>ya", ":%y+<CR>", { desc = "Yank all file to clipboard" })

-- Save file with <leader>w
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })

-- Diagnostic menu
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Navigate bufferes
vim.keymap.set("n", "<leader>bn", ":bn<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bp<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bl", ":bl<CR>", { desc = "Last buffer" })
vim.keymap.set("n", "<leader>bf", ":bf<CR>", { desc = "First buffer" })

--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Use CTRL+SHIFT+<hjkl> to move windows
vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- Run python files using uv with <leader>rp
local function run_python()
	local file = vim.fn.expand("%:p")
	local Terminal = require("toggleterm.terminal").Terminal
	local py_run = Terminal:new({
		cmd = "uv run " .. file,
		direction = "horizontal",
		close_on_exit = false,
	})
	py_run:toggle()
end

vim.keymap.set("n", "<leader>rp", run_python, { desc = "Run current Python file" })

-- Run C files with <leader>rc
local function run_c()
	local file = vim.fn.expand("%:p")
	local out = vim.fn.expand("%:p:r") -- filename without extension
	local Terminal = require("toggleterm.terminal").Terminal
	local c_run = Terminal:new({
		cmd = string.format("gcc -Wall -Wextra %s -o %s && %s", file, out, out),
		direction = "horizontal",
		close_on_exit = false,
	})
	c_run:toggle()
end
vim.keymap.set("n", "<leader>rc", run_c, { desc = "Run current C file" })

-- Open oil
vim.keymap.set("n", "-", "<cmd>Oil .<CR>", { desc = "Open Oil file manager" })
vim.keymap.set("n", "<leader>fm", function()
	require("oil").open_float()
end, { desc = "Open Oil file manager" })
