return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			context_commentstring = {
				enable = true,
				enable_autocmd = false,
			},
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"svelte",
				"css",
				"javascript",
				"typescript",
				"html",
				"glimmer",
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})

		vim.cmd("autocmd BufNewFile,BufRead *.handlebars set filetype=glimmer") -- see .handlebars as glimmer files
	end,
}
