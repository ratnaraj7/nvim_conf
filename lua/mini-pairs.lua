return {
	"echasnovski/mini.pairs",
	config = function()
		require("mini.pairs").setup({})
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "rust",
			command = "lua vim.keymap.set('i', \"'\", \"'\", { buffer = 0 }) "
		})
	end
}
