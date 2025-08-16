-- SETTINGS
---------------------------------
vim.o.number = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.swapfile = false
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.cursorline = true
vim.o.termguicolors = true
vim.o.backspace = "indent,eol,start"
vim.o.signcolumn = "yes"

-- PLUGIN MANAGEMENT
---------------------------------
local mini_path = vim.fn.stdpath("data") .. "/site/pack/deps/start/mini.deps"
if not vim.loop.fs_stat(mini_path) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/echasnovski/mini.deps",
    mini_path,
  })
end
vim.opt.rtp:prepend(mini_path)

local MiniDeps = require("mini.deps")
local add = MiniDeps.add

-- PLUGINS
---------------------------------
-- Treesitter
add("nvim-treesitter/nvim-treesitter")
require("nvim-treesitter.configs").setup({
  ensure_installed = { "lua", "javascript", "typescript", "html", "css", "svelte", "vue", "json", "markdown" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})

-- Oil
add("stevearc/oil.nvim")
require("oil").setup()

-- Lualine
add("nvim-lualine/lualine.nvim")
require("lualine").setup()

-- Copilot
add("github/copilot.vim")

-- Autocompletion
add('echasnovski/mini.completion')

-- LSP
add("neovim/nvim-lspconfig")
local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({})
lspconfig.jsonls.setup({})
lspconfig.svelte.setup({})
lspconfig.ts_ls.setup({})
lspconfig.html.setup({})
lspconfig.cssls.setup({})
lspconfig.tailwindcss.setup({})
lspconfig.volar.setup({
  filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact", "vue" },
})

-- Fuzzy Finder
add("ibhagwan/fzf-lua")
require("fzf-lua").setup()
-- Classy
add("jcha0713/classy.nvim")
require("classy").setup()
-- Mini Pairs
add("echasnovski/mini.pairs")
require("mini.pairs").setup()
-- Mini AI
add("echasnovski/mini.ai")
require("mini.ai").setup()
-- Surround
add("kylechui/nvim-surround")
require("nvim-surround").setup()
-- Treesj
add("Wansmer/treesj")
require("treesj").setup()
-- ToggleTerm
add("akinsho/toggleterm.nvim")
require("toggleterm").setup({
  open_mapping = [[<c-t>]],
})
-- Colorscheme
add("WilliamHsieh/catppuccin.nvim")
vim.cmd("colorscheme catppuccin-macchiato")

-- AUTO-FORMAT ON SAVE
---------------------------------
-- Use LSP if available, fallback to Prettier CLI
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local clients = vim.lsp.buf_get_clients()
    local has_formatter = false
    for _, client in pairs(clients) do
      if client.supports_method("textDocument/formatting") then
        has_formatter = true
      end
    end

    if has_formatter then
      vim.lsp.buf.format({ async = true })
    elseif vim.fn.expand("%:e") == "vue" then
      -- fallback: run Prettier CLI on Vue files
      vim.cmd("silent !prettier --write %")
      vim.cmd("edit!") -- reload buffer
    end
  end,
})

-- KEYBINDINGS
---------------------------------
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
vim.keymap.set("n", "<leader>f", "<CMD>lua vim.lsp.buf.format({ async = true })<CR>", { desc = "Format current buffer" })
-- Terminal escape
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true })
