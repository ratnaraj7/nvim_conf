return {
	"williamboman/mason.nvim",
	config = function()
		local mason = require("mason")
		mason.setup({
			ensure_installed = {
				"lua-language-server",
				"rust-analyzer",
				"tailwindcss-language-server",
				"typescript-language-server",
				"vtsls",
				"stylua",
				"python-lsp-server",
				"prettier",
				"html-lsp",
				"eslint_d",
				"dockerfile-language-server",
				"docker-compose-language-service",
				"json-lsp",
				"clangd",
			},
		})
	end,
}
