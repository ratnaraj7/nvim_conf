return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local util = require("lspconfig/util")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap
		local opts = { noremap = true, silent = true }

		local on_attach = function(client, bufnr)
			opts.buffer = bufnr

			-- set keybinds
			opts.desc = "Show LSP references"
			keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

			opts.desc = "Go to declaration"
			keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

			opts.desc = "Show LSP definitions"
			keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

			opts.desc = "Show LSP implementations"
			keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

			opts.desc = "Show LSP type definitions"
			keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

			opts.desc = "See available code actions"
			keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

			opts.desc = "Smart rename"
			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

			opts.desc = "Show buffer diagnostics"
			keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

			opts.desc = "Show line diagnostics"
			keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

			opts.desc = "Go to previous diagnostic"
			keymap.set("n", "[d", function()
				vim.diagnostic.jump({ count = -1, float = true })
			end, opts) -- jump to previous diagnostic in buffer

			opts.desc = "Go to next diagnostic"
			keymap.set("n", "]d", function()
				vim.diagnostic.jump({ count = 1, float = true })
			end, opts) -- jump to next diagnostic in buffer

			opts.desc = "Show documentation for what is under cursor"
			keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

			opts.desc = "Restart LSP"
			keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
		end

		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- configure language servers

		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})

		lspconfig.rust_analyzer.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				["rust-analyzer"] = {
					imports = {
						granularity = {
							group = "module",
						},
						prefix = "self",
					},
					cargo = {
						buildScripts = {
							enable = true,
						},
					},
					procMacro = {
						enable = true,
					},
					checkOnSave = {
						command = "clippy",
					},
					completion = {
						autoimport = {
							enable = true,
						},
					},
				},
			},
		})

		lspconfig.tsserver.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig.clangd.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig.jsonls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				json = {
					schemas = {
						{
							fileMatch = { "package.json" },
							url = "https://json.schemastore.org/package.json",
						},
					},
				},
			},
		})

		lspconfig.pylsp.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig.docker_compose_language_service.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig.dockerls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig.htmx.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "html", "templ", "htmldjango" },
		})

		lspconfig.html.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "html", "templ", "htmldjango" },
		})

		lspconfig.tailwindcss.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "html", "templ", "htmldjango", "jsx", "typescriptreact", "rust", "templ" },
		})


		lspconfig.terraformls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "terraform", "tf" },
		})


		lspconfig.gopls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			cmd = { "gopls" },
			filetypes = { "go", "gomod", "gowork", "gotmpl", },
			root_dir = util.root_pattern("go.work", "go.mod", ".git"),
			settings = {
				gopls = {
					gofumpt = true
				}
			}
		})

		lspconfig.templ.setup({
			capabilities = capabilities,
			on_attach = on_attach
		})
	end,
}
