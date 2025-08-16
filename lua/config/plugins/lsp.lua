return {
  "neovim/nvim-lspconfig",
  config = function()
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
  end,
}
