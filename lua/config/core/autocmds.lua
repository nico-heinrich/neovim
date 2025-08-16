-- Auto commands
-- AUTO-FORMAT ON SAVE
-- Use LSP if available, fallback to Prettier CLI
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local clients = vim.lsp.buf_get_clients()
    local has_formatter = false
    for _, client in pairs(clients) do
      if client.supports_method("textDocument/formatting") then
        has_formatter = true
      end
    end

    if has_formatter then
      vim.lsp.buf.format({ async = true })
    elseif vim.fn.expand("%:e") == "vue" then
      -- fallback: run Prettier CLI on Vue files
      vim.cmd("silent !prettier --write %")
      vim.cmd("edit!") -- reload buffer
    end
  end,
})
