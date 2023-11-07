return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function () 
    local configs = require("nvim-treesitter.configs")

    configs.setup({
        ensure_installed = {
          "c",
          "lua",
          "vim",
          "vimdoc",
          "query",
          "svelte",
          "css",
          "javascript",
          "html",
          "glimmer",
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },  
      })

      vim.cmd("autocmd BufNewFile,BufRead *.handlebars set filetype=glimmer") -- see .handlebars as glimmer files
  end
}

