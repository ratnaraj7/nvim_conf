return {

	{
		"tpope/vim-dadbod",
		cmd = "DB",
	},
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			"tpope/vim-dadbod",
		},
		cmd = {
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		keys = {
			{ "<leader>D", "<cmd>DBUIToggle<CR>", desc = "Toggle DBUI" },
		},
		init = function()
			local data = vim.fn.stdpath("data")
			vim.g.db_ui_env_variable_url = 'DATABASE_URL'
			vim.g.db_ui_save_location = data .. "/dadbod_ui"
			vim.g.db_ui_tmp_query_location = data .. "/dadbod_ui/tmp"
			vim.g.db_ui_show_database_icon = true
			vim.g.db_ui_use_nerd_fonts = true
			vim.g.db_ui_win_position = "right"
			-- NOTE: The default behavior of auto-execution of queries on save is disabled
			-- this is useful when you have a big query that you don't want to run every time
			-- you save the file running those queries can crash neovim to run use the
			-- default keymap: <leader>S
			-- vim.g.db_ui_execute_on_save = false
		end,

	},
	{
		"kristijanhusak/vim-dadbod-completion",
		dependencies = {
			"tpope/vim-dadbod",
		},
		ft = { "sql", "plsql" },
		init = function()
			-- cmp
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "sql", "plsql" },
				callback = function()
					local cmp = require("cmp")

					local sources = vim.tbl_map(function(source)
						return { name = source.name }
					end, cmp.get_config().sources)

					table.insert(sources, { name = "vim-dadbod-completion" })

					cmp.setup.buffer({ sources = sources })
				end,
			})
		end,
	}
}
