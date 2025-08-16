return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")

    -- Set custom diagnostic signs with squares
    local signs = { Error = "", Warning = "", Hint = "", Information = "" }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- Enable basic diagnostic display
    vim.diagnostic.config({
      virtual_lines = true,
      signs = true,
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
