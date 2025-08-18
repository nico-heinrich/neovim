-- Key mappings
vim.g.mapleader = " "

-- Vertical split
vim.keymap.set("n", "|", ":vs<CR>", { noremap = true })

-- Jump to start/end of line
vim.keymap.set("n", "H", "_", { noremap = true })
vim.keymap.set("n", "L", "$", { noremap = true })

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true })

-- Moving lines in visual mode
vim.keymap.set("n", "<C-j>", ":m .+1<CR>==gi", { noremap = true })
vim.keymap.set("n", "<C-k>", ":m .-2<CR>==gi", { noremap = true })
vim.keymap.set("i", "<C-j>", "<Esc>:m .+1<CR>==gi", { noremap = true })
vim.keymap.set("i", "<C-k>", "<Esc>:m .-2<CR>==gi", { noremap = true })
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv", { noremap = true })
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv", { noremap = true })

-- File Explorer
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Fuzzy finding
vim.keymap.set("n", "<leader><leader>", "<CMD>FzfLua files<CR>", { desc = "Fuzzy find files" })
vim.keymap.set("n", "<leader>,", "<CMD>FzfLua buffers<CR>", { desc = "Fuzzy find buffers" })
vim.keymap.set("n", "//", "<CMD>FzfLua live_grep<CR>", { desc = "Fuzzy find live grep" })

-- Class manipulation
vim.keymap.set("n", "<leader>ic", ":ClassyAddClass<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>dc", ":ClassyRemoveClass<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>rc", ":ClassyResetClass<CR>", { noremap = true, silent = true })

-- Format buffer
vim.keymap.set("n", "<leader>f", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format current buffer" })

-- Terminal escape
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true })

-- Completion keybindings (nvim-cmp handles these automatically)
-- <C-Space> - Trigger completion
-- <C-n>/<C-p> - Navigate completion items
-- <CR> - Confirm selection
-- <Tab> - Next item or expand snippet
-- <S-Tab> - Previous item or jump snippet
