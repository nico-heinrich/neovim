return {
  "neovim/nvim-lspconfig",
  config = function()
    vim.diagnostic.config({
      virtual_lines = false,
      underline = true,
      update_in_insert = false,
    })

    local function capabilities_without_formatting()
      local caps = vim.lsp.protocol.make_client_capabilities()
      caps.textDocument.formatting = false
      return caps
    end

    local no_format = { capabilities = capabilities_without_formatting() }

    for _, server in ipairs({
      "lua_ls",
      "jsonls",
      "ts_ls",
      "html",
      "cssls",
      "tailwindcss",
    }) do
      vim.lsp.config(server, no_format)
      vim.lsp.enable(server)
    end

    -- Svelte keeps LSP formatting (conform handles other filetypes)
    vim.lsp.config("svelte", {})
    vim.lsp.enable("svelte")
  end,
}
