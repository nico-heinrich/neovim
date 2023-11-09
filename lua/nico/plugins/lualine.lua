local function Get_buffer_path()
  local file_path = vim.fn.expand('%:p')
  local is_readable_file = vim.fn.filereadable(file_path) == 1

  if is_readable_file then
    return vim.fn.fnamemodify(file_path, ':t')
  else
    local pattern = "oil:///(.+)"
    local clean_path = string.match(file_path, pattern)

    return clean_path or ""
  end
end

-- Load lualine and its dependencies
return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      sections = {
        lualine_c = { { Get_buffer_path, separator = '' } },
      },
    })
  end
}

