return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")

    -- Enable basic diagnostic display with custom signs (virtual lines disabled by default)
    vim.diagnostic.config({
      virtual_lines = false,
      underline = true,
      update_in_insert = false,
    })

    -- Common LSP configuration that disables formatting
    local common_config = {
      capabilities = {
        textDocument = {
          formatting = false,
        },
      },
    }

    -- Svelte LSP with formatting enabled
    lspconfig.svelte.setup({
      capabilities = {
        textDocument = {
          formatting = true,
        },
      },
    })

    lspconfig.lua_ls.setup(common_config)
    lspconfig.jsonls.setup(common_config)
    lspconfig.ts_ls.setup(common_config)
    lspconfig.html.setup(common_config)
    lspconfig.cssls.setup(common_config)
    lspconfig.tailwindcss.setup(common_config)
  end,
}
