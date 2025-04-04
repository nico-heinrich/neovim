return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.4",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "BurntSushi/ripgrep",
    "sharkdp/fd",
    "nvim-telescope/telescope-ui-select.nvim",
  },
  config = function()
    vim.keymap.set("n", "<leader><space>", ":Telescope find_files<CR>", { noremap = true })
    vim.keymap.set("n", "<leader>,", ":Telescope buffers<CR>", { noremap = true })
    vim.keymap.set("n", "<leader>/", ":Telescope live_grep<CR>", { noremap = true })

    require("telescope").load_extension("ui-select")

    -- basic telescope configuration
    local harpoon = require('harpoon')
    harpoon:setup({})

    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
            table.insert(file_paths, item.value)
        end

        require("telescope.pickers").new({}, {
            prompt_title = "Harpoon",
            finder = require("telescope.finders").new_table({
                results = file_paths,
            }),
            previewer = conf.file_previewer({}),
            sorter = conf.generic_sorter({}),
        }):find()
    end

    vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
        { desc = "Open harpoon window" })
  end,
}

