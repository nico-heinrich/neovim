functions = require("nico.core.functions")

vim.g.mapleader = " "

-- Resource .vimrc
vim.keymap.set("n", "<leader>rv", ":source $MYVIMRC<CR>", { noremap = true })

-- Moving lines
vim.keymap.set("n", "<C-j>", ":m .+1<CR>==gi", { noremap = true })
vim.keymap.set("n", "<C-k>", ":m .-2<CR>==gi", { noremap = true })
vim.keymap.set("i", "<C-j>", "<Esc>:m .+1<CR>==gi", { noremap = true })
vim.keymap.set("i", "<C-k>", "<Esc>:m .-2<CR>==gi", { noremap = true })
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv", { noremap = true })
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv", { noremap = true })

-- Moving between windows
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true })

-- Jump to start/end of line
vim.keymap.set("n", "H", "_", { noremap = true })
vim.keymap.set("n", "L", "$", { noremap = true })

-- Paste from initial yank
vim.keymap.set("n", "<leader>p", '"0p', { noremap = true })

-- Get out of terminal mode with Esc
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true })

-- Split screen vertically
vim.keymap.set("n", "|", ":vs<CR>", { noremap = true })

-- Set filetype shortcuts
vim.cmd([[cnoreabbrev sft setfiletype]]) -- :sft => :setfiletype

-- Replace all ' with " in selection
vim.keymap.set("v", "''", [[<Esc>:%s/'/"/g<CR>]], { noremap = true })

-- Restart LSP
vim.api.nvim_set_keymap("n", "<leader>l", ":LspRestart<CR>", { noremap = true, silent = true })

-- Format code
vim.keymap.set("n", "<leader>f", function()
	vim.lsp.buf.formatting()
end)
