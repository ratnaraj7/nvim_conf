return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",

		-- snippets
		{
			"L3MON4D3/LuaSnip",
			-- jumper
			keys = {
				{
					"<tab>",
					function()
						return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
					end,
					expr = true,
					silent = true,
					mode = "i",
				},
				{
					"<tab>",
					function()
						require("luasnip").jump(1)
					end,
					mode = "s",
				},
				{
					"<s-tab>",
					function()
						require("luasnip").jump(-1)
					end,
					mode = { "i", "s" },
				},
			},
		},

		"saadparwaiz1/cmp_luasnip",

		-- vscode like snippet
		"rafamadriz/friendly-snippets",

		-- lsp
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			mapping = cmp.mapping.preset.insert({
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			}),
			experimental = {
				ghost_text = {
					hl_group = "LspCodeLens",
				},
			},
		})
	end,
}
