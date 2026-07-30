-- Set <space> the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Line wrap
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true

-- Use nerd font
vim.g.have_nerd_font = true

-- Show line numbers
vim.o.number = true

-- Use relative line numbers
vim.o.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Hide / show mode
vim.o.showmode = true

-- Sync clipboard between OS and neovim
vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)

-- Enable break indent
vim.o.breakindent = true

-- Enable undo/redo even after closing and reopening a file
vim.o.undofile = true

-- Make searching case insensitive
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence time
vim.o.timeoutlen = 500

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Set whitespace display
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions
vim.o.inccommand = 'split'

-- Show cursor line
vim.o.cursorline = true

-- Minimal number of lines above and below the cursor
vim.o.scrolloff = 10

-- Confirm action
vim.o.confirm = true

-- Highlight when copying text
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function() vim.hl.on_yank() end,
})

-- Indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Diagnostic Config & Keymaps
vim.diagnostic.config {
    update_in_insert = false,
    severity_sort = true,
    float = { border = 'rounded', source = 'if_many' },
    underline = { severity = { min = vim.diagnostic.severity.WARN } },

    -- Can switch between these as you prefer
    virtual_text = true,   -- Text shows up at the end of the line
    virtual_lines = false, -- Text shows up underneath the line, with virtual lines

    -- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
    jump = {
        on_jump = function(_, bufnr)
            vim.diagnostic.open_float {
                bufnr = bufnr,
                scope = 'cursor',
                focus = false,
            }
        end,
    },
}
