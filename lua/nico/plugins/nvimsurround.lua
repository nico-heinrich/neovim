return {
  "kylechui/nvim-surround",
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({
      surrounds = {
        ['c'] = {
          add = function()
            local condition = vim.fn.input("Enter condition: ")

            return {
                { '{#if ' .. condition .. '}\n' },
                { '\n{/if}' }
            }, { "line" }
          end,
        },
        ['e'] = {
          add = function()
            local iterable = vim.fn.input("Enter iterable: ")
            local variable = ''
            if #iterable > 1 then
                local lastChar = iterable:sub(-1)
                variable = vim.fn.input(iterable .. " as ", lastChar == 's' and iterable:sub(1, -2) or '')
            else
                variable = vim.fn.input(iterable .. " as ") or 'item'
            end
            local isIndex = vim.fn.input("Include index? (y/n): ")

            return {
                { '{#each ' .. iterable .. ' as ' .. variable .. (isIndex == 'y' and ', i' or '') .. '}\n' },
                { '\n{/each}' }
            }, { "line" }
          end,
        },
      }
    })
  end
}
