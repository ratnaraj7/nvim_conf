return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
			auto_install = true,
			highlight = {
				enable = true,
			},
			-- TODO
			incremental_selection = {
				enable = true,
				--	keymaps = {
				--		init_selection = "<Leader>n", -- set to `false` to disable one of the mappings
				--		node_incremental = "<Leader>g",
				--		scope_incremental = "grc",
				--		node_decremental = "grm",
				--	},
			},
		})
	end,
}
