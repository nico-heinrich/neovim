M = {}

-- Function to jump to an attribute (like class="value", id="value", etc.)
function M.Jump_to_attribute(attribute)
  local line = vim.fn.getline('.')
  local attribute_exists = line:match(attribute .. '="[^"]*"')

  if attribute_exists then
    vim.fn.execute('normal! ^')
    local attribute_pos = line:find(attribute .. '="')

    if attribute_pos then
      vim.fn.execute('normal! ' .. attribute_pos - 1 .. '|')

      local cursor_col = vim.fn.col('.')
      if cursor_col > attribute_pos then
        vim.fn.execute('normal! F"')
      else
        vim.fn.execute('normal! f"')
      end

      vim.fn.execute('normal! l')
    end
  else
    print("No " .. attribute .. " attribute found")
  end
end

-- Function to insert a new value into an attribute or add the attribute if not present
function M.Insert_attribute(attribute)
  local line = vim.fn.getline('.')
  local attribute_exists = line:match(attribute .. '="[^"]*"')
  local is_empty = line:match(attribute .. '=""')
  local has_closing_bracket = line:match('>')
  local is_explicitly_closed = line:match('/>')
  local is_closing_tag = line:match('^%s*</')

  if is_closing_tag then
    print("Cannot insert " .. attribute .. " attribute in a closing tag")
    return
  end

  if attribute_exists then
    vim.fn.execute('normal! ^')
    local attribute_pos = line:find(attribute .. '="')
    vim.fn.execute('normal! ' .. attribute_pos - 1 .. '|')
    vim.fn.execute('normal! f"')
    vim.fn.execute('normal! l')

    if is_empty then
      vim.fn.execute('startinsert')
    else
      vim.fn.execute('normal! f"')
      vim.fn.execute('normal! i ')
      vim.fn.execute('normal! l')
      vim.fn.execute('startinsert')
    end
  elseif has_closing_bracket then
    vim.fn.execute('normal! ^f>')
    if is_explicitly_closed then
      vim.fn.execute('normal! hiclass="" ')
      vim.fn.execute('normal! h')
    else
      vim.fn.execute('normal! i class=""')
    end
    vim.fn.execute('startinsert')
  else
    print("Could not insert " .. attribute .. " attribute into the line")
  end
end

-- Function to delete the value of a specified attribute
function M.Delete_attribute(attribute)
  local line = vim.fn.getline('.')
  local pos = vim.fn.getpos('.')
  local attribute_exists = line:match(attribute .. '="[^"]*"')

  if attribute_exists then
    vim.fn.execute('normal! ^')
    local attribute_pos = line:find(attribute .. '="')
    vim.fn.execute('normal! ' .. attribute_pos - 1 .. '|')

    vim.fn.execute('normal! v')
    vim.fn.execute('normal! f"')
    vim.fn.execute('normal! f"')
    vim.fn.execute('normal! d')
    vim.fn.setpos('.', pos)
  else
    print("No " .. attribute .. " attribute found")
  end
end

return M
