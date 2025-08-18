-- Auto commands
-- Test autocmd to verify the system is working
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    print("File loaded: " .. vim.fn.expand("%"))
  end,
})
