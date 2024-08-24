M = {}

-- Jump to class attribute
function M.Jump_to_class()
  local line = vim.fn.getline('.')
  local class_exists = line:match('class="[^"]*"')
  if class_exists then
    vim.fn.execute('normal! ^')
    vim.fn.search('class="')
    vim.fn.execute('normal! f"')
    vim.fn.execute('normal! l')
  end
end

-- Insert class attribute or add to existing
function M.Insert_class()
  local line = vim.fn.getline('.')
  local class_exists = line:match('class="[^"]*"')
  local is_empty = line:match('class=""')
  if class_exists then
    vim.fn.execute('normal! ^')
    vim.fn.search('class="')
    vim.fn.execute('normal! f"')
    vim.fn.execute('normal! f"')
    if is_empty then
      vim.fn.execute('startinsert')
    else
      vim.fn.execute('normal! i ')
      vim.fn.execute('normal! l')
      vim.fn.execute('startinsert')
    end
  else
    vim.fn.execute('normal! ^f>i class=""')
    vim.fn.execute('startinsert')
  end
end

-- Remove class attribute
function M.Delete_class()
  local line = vim.fn.getline('.')
  local pos = vim.fn.getpos('.')
  local class_exists = line:match('class="[^"]*"')
  if class_exists then
    vim.fn.execute('normal! ^')
    vim.fn.search(' class="')
    vim.fn.execute('normal! v')
    vim.fn.execute('normal! f"')
    vim.fn.execute('normal! f"')
    vim.fn.execute('normal! d')
    vim.fn.setpos('.', pos)
  end
end

-- Remove all lines with console.logs in JavaScript files
function M.Delete_console_logs()
  local line_count = vim.fn.line('$')
  for i = 1, line_count do
    local line = vim.fn.getline(i)
    if line:match('console.log') then
      vim.fn.execute(i .. 'd')
    end
  end
end

return M
