return {
	'folke/snacks.nvim',
	lazy = false,
	priority = 1000,
	opts = {
		scope = { enabled = true },
		debug = { enabled = true },
		indent = { enabled = true },
		lazygit = { enable = true },
		scroll = { enabled = true },
		bigfile = { enabled = true },
		quickfile = { enabled = true },
		notifier = {
			enabled = true,
			timeout = 1000,
			style = 'fancy', -- compact/fancy/minimal
			width = { min = 30, max = 0.3 },
			height = { min = 1, max = 0.6 },
			margin = { top = 1, right = 1, bottom = 1 },
			padding = true,
		},
	},
	keys = {
		{
			'<leader>n',
			function()
				Snacks.notifier.show_history()
			end,
			desc = 'Show notification history with snacks',
		},
		{
			'<leader>gg',
			function()
				Snacks.lazygit()
			end,
			desc = 'Lazygit',
		},
	},
}
