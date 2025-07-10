return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	config = function()
		require("conform").setup({
			format_on_save = {
				lsp_fallback = true,
				timeout_ms = 3000,
			},
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				json = { "prettier" },
				markdown = { "prettier" },
				lua = { "stylua" },
				html = { "prettier" },
				css = { "prettier" },
				svelte = { "prettier" },
				vue = { "prettier" },
			},
		})
	end,
}
