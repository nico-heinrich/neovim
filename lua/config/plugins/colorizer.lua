return {
  "norcalli/nvim-colorizer.lua",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "ColorizerToggle" },
  config = function()
    require("colorizer").setup({
      filetypes = {
        "css", "scss", "less", "html", "vue", "svelte",
        "javascript", "typescript", "javascriptreact", "typescriptreact",
        "lua", "json", "yaml", "markdown"
      },
      user_default_options = {
        RGB = true,
        RRGGBB = true,
        names = false,
        RRGGBBAA = true,
        mode = "background",
        tailwind = true,
      },
    })
  end,
}
