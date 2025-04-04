return {
    'jsongerber/nvim-px-to-rem',
    config = function()
        require('nvim-px-to-rem').setup({
          filetypes = {
            'css',
            'scss',
            'sass',
            'less',
            'stylus',
            'vue',
            'html',
            'javascript',
            'typescript',
            'jsx',
            'tsx',
          },
        })

        vim.api.nvim_set_keymap('n', '<leader>r', ':PxToRemLine<CR>', { noremap = true, silent = true })
    end
}
