return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")

    -- Enable basic diagnostic display with custom signs
    vim.diagnostic.config({
      virtual_lines = true,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN] = " ",
          [vim.diagnostic.severity.HINT] = " ",
          [vim.diagnostic.severity.INFO] = " ",
        },
        numhl = {
          [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
          [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
          [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
          [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
        },
      },
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
