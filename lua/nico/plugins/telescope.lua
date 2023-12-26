return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.4",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "BurntSushi/ripgrep",
    "sharkdp/fd",
  },
  config = function()
    vim.keymap.set("n", "<leader><space>", ":Telescope find_files<CR>", { noremap = true })
    vim.keymap.set("n", "<leader>,", ":Telescope buffers<CR>", { noremap = true })
    vim.keymap.set("n", "<leader>/", ":Telescope live_grep<CR>", { noremap = true })
  end,
}

