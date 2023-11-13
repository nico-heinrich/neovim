vim.g.mapleader = " "

-- Moving lines
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { noremap = true })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { noremap = true })
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { noremap = true })
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { noremap = true })
vim.keymap.set("x", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true })
vim.keymap.set("x", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true })

-- Adding lines without leaving normal mode
vim.keymap.set("n", "<leader>o", "o<Esc>", { noremap = true })
vim.keymap.set("n", "<leader>O", "O<Esc>", { noremap = true })

-- Moving between windows
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true })

-- Get out of terminal mode with Esc
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true })

-- Set filetype shortcuts
vim.cmd[[cnoreabbrev sft setfiletype]] -- :sft => :setfiletype
vim.keymap.set("n", "<leader>html", ":setfiletype html<CR>", { noremap = true }) -- Set file type to HTML
vim.keymap.set("n", "<leader>rft", ":setfiletype cpp<CR>", { noremap = true }) -- Reset file type
