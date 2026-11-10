-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = "a"

-- Allow line numbers, breakpoints, and git symbols in a separate column beside the regular text
vim.opt.signcolumn = "yes"

-- Show file title
vim.opt.title = true

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Enables terminal true colors
vim.opt.termguicolors = true

-- Save undo history
vim.o.undofile = true

-- Shows you a menu with the match options withou selecting by default
vim.o.completeopt = "menuone,noselect"

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Indent config
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Indent helpers
vim.opt.smartindent = true

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = "unnamedplus"

-- Enable cursor line highlighting (only shown in the active window, see autocmds.lua)
vim.opt.cursorline = true

-- Set highlight on search
vim.o.hlsearch = false

-- Set only one status line and not one per window
vim.opt.laststatus = 3

-- Open new vertical splits to the right
vim.opt.splitright = true

-- Rounded borders for every floating window (LSP hover, diagnostics, pickers...) (Neovim >= 0.11)
if vim.fn.has("nvim-0.11") == 1 then
  vim.o.winborder = "rounded"
end
