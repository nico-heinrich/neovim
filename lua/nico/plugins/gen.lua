return {
  "David-Kunz/gen.nvim",
  config = function()
    vim.keymap.set({ 'n', 'v' }, '<leader>g', ':Gen<CR>')

    require('gen').setup({})

    require('gen').prompts['Fix_Code'] = {
      prompt = "Fix the following code. Only ouput the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
      replace = true,
      extract = "```$filetype\n(.-)```"
    }

    require('gen').prompts['Generate_Code'] = {
      prompt = "Generate code in ```$filetype\n...\n```. I don't need examples or comments btw. $input",
      replace = true,
      extract = "```$filetype\n(.-)```"
    }
  end
}
