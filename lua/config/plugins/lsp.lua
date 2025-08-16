return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")

    -- Enable basic diagnostic display with custom signs
    vim.diagnostic.config({
      virtual_lines = true,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.HINT] = "",
          [vim.diagnostic.severity.INFO] = "",
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
