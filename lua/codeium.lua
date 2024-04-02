return {
	"Exafunction/codeium.vim",
	config = function()
		--vim.g.codeium_manual = true
		vim.keymap.set('i', '<C-g>', function() return vim.fn['codeium#Accept']() end,
			{ expr = true, silent = true })

		vim.keymap.set('i', '<C-,>', function() return vim.fn['codeium#CycleCompletions'](1) end,
			{ expr = true, silent = true })

		vim.keymap.set('i', '<C-/>', function() return vim.fn['codeium#CycleCompletions'](-1) end,
			{ expr = true, silent = true })

		vim.keymap.set('i', '<C-x>', function() return vim.fn['codeium#Clear']() end,
			{ expr = true, silent = true })

		--vim.keymap.set('i', '<C-b>', function() return vim.fn['codeium#Chat']() end,
		--{ expr = true, silent = true })
	end
}
