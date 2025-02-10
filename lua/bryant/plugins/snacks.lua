return {
	'folke/snacks.nvim',
	lazy = false,
	priority = 1000,
	opts = {
		scope = { enabled = true },
		debug = { enabled = true },
		indent = { enabled = true },
		scroll = { enabled = true },
		bigfile = { enabled = true },
		quickfile = { enabled = true },
		lazygit = { enable = true },
		zen = {
			enabled = false,
			toggles = { dim = false },
			win = { width = 85, backdrop = { transparent = false, blend = 99 } },
		},
		notifier = {
			enabled = true,
			timeout = 1000,
			style = 'fancy', -- compact/fancy/minimal
			width = { min = 30, max = 0.3 },
			height = { min = 1, max = 0.6 },
			margin = { top = 1, right = 1, bottom = 1 },
			padding = true,
		},
		styles = {
			float = {
				height = 0.8,
				width = 0.8,
			},
		},
	},
	keys = {
		{
			'<leader>n',
			function()
				Snacks.notifier.show_history()
			end,
			desc = 'Snacks notifier',
		},
		{
			'<leader>G',
			function()
				Snacks.lazygit()
			end,
			desc = 'Snacks lazygit',
		},
		{
			'<leader>gg',
			function()
				Snacks.lazygit.log()
			end,
			desc = 'Snacks lazygit log',
		},
		{
			'zm',
			function()
				Snacks.zen()
			end,
			desc = 'Snacks zen',
		},
	},
}
