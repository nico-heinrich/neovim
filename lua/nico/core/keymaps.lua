vim.g.mapleader = " "

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

-- New line between HTML tags
vim.keymap.set("i", "<C-CR>", "<CR><Esc>O")
