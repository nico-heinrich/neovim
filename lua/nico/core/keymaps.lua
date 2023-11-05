vim.g.mapleader = " "

-- moving lines
vim.api.nvim_set_keymap("n", "<A-j>", ":m .+1<CR>==", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-k>", ":m .-2<CR>==", { noremap = true })
vim.api.nvim_set_keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { noremap = true })
vim.api.nvim_set_keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { noremap = true })
vim.api.nvim_set_keymap("x", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true })
vim.api.nvim_set_keymap("x", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true })

-- adding lines without leaving normal mode
vim.keymap.set("n", "<leader>o", "o<Esc>", { noremap = true })
vim.keymap.set("n", "<leader>O", "O<Esc>", { noremap = true })

-- moving between windows
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true })

-- get out of terminal mode with Esc
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true })

-- set filetype shortcut
vim.cmd[[cnoreabbrev sft setfiletype]]