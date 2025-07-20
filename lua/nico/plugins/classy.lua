return {
	"jcha0713/classy.nvim",
	config = function()
		require("classy").setup()
		vim.keymap.set("n", "<leader>ic", ":ClassyAddClass<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>dc", ":ClassyRemoveClass<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>rc", ":ClassyResetClass<CR>", { noremap = true, silent = true })
	end,
}
