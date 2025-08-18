return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    -- Define formatters
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      vue = { "prettier" },
      css = { "prettier" },
      scss = { "prettier" },
      less = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      graphql = { "prettier" },
    },
    -- Set up format-on-save
    format_on_save = function(bufnr)
      -- Disable with a global or buffer-local variable
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      -- Enable LSP fallback for Svelte files
      local filetype = vim.bo[bufnr].filetype
      if filetype == "svelte" then
        return { timeout_ms = 3000, lsp_fallback = true }
      end
      return { timeout_ms = 3000, lsp_fallback = false }
    end,
    -- Customize formatters
    formatters = {
      prettier = {
        prepend_args = { 
          "--print-width", "80", 
          "--tab-width", "2"
        },
      },
    },
  },
  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
