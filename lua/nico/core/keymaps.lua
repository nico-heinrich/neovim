functions = require('nico.core.functions')

vim.g.mapleader = " "

-- Resource .vimrc
vim.keymap.set("n", "<leader>rv", ":source $MYVIMRC<CR>", { noremap = true })

-- Moving lines
vim.keymap.set("i", "<C-j>", "<Esc>:m .+1<CR>==gi", { noremap = true })
vim.keymap.set("i", "<C-k>", "<Esc>:m .-2<CR>==gi", { noremap = true })
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv", { noremap = true })
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv", { noremap = true })

-- Moving between windows
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true })

-- Get out of terminal mode with Esc
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true })

-- Set filetype shortcuts
vim.cmd[[cnoreabbrev sft setfiletype]] -- :sft => :setfiletype

-- Replace all ' with " in selection
vim.keymap.set("v", "''", [[<Esc>:%s/'/"/g<CR>]], { noremap = true })

-- New line between HTML tags
vim.keymap.set("i", "<C-CR>", "<CR><Esc>O")

-- HTML class manipulation
vim.api.nvim_set_keymap('n', '<leader>ic', ':lua functions.Insert_class()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>c', ':lua functions.Jump_to_class()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dc', ':lua functions.Delete_class()<CR>', { noremap = true, silent = true })

-- Remove all lines with console.logs
vim.api.nvim_set_keymap('n', '<leader>rl', ':lua functions.Delete_console_logs()<CR>', { noremap = true, silent = true })
