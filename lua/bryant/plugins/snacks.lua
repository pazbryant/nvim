return {
	'folke/snacks.nvim',
	lazy = false,
	priority = 1000,
	opts = {
		win = { enabled = false },
		dim = { enabled = false },
		git = { enabled = false },
		util = { enabled = false },
		image = { enabled = false },
		rename = { enabled = false },
		toggle = { enabled = false },
		scroll = { enabled = false },
		notify = { enabled = false },
		layout = { enabled = false },
		scratch = { enabled = false },
		animate = { enabled = false },
		profiler = { enabled = false },
		terminal = { enabled = false },
		dashboard = { enabled = false },
		gitbrowse = { enabled = false },

		scope = { enabled = true },
		lazygit = { enable = true },
		debugq = { enabled = true },
		indent = { enabled = true },
		bigfile = { enabled = true },
		quickfile = { enabled = true },
		bufdelete = { enabled = true },
		zen = {
			enabled = true,
			toggles = { dim = false },
			win = { width = 100, backdrop = { transparent = false, blend = 99 } },
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
			'<leader>N',
			function()
				Snacks.notifier.show_history()
			end,
			desc = 'Snacks notifier',
		},
		{
			'<leader>gg',
			function()
				Snacks.lazygit()
			end,
			desc = 'Snacks lazygit',
		},
		{
			'<leader>G',
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
		{
			'<leader>bd',
			function()
				Snacks.bufdelete()
				vim.notify('Buffer has been deleted', vim.log.levels.INFO)
			end,
			desc = 'Snacks bufdelete',
		},
		{
			'<leader>bD',
			function()
				Snacks.bufdelete.all()
				vim.notify('All buffers has been deleted', vim.log.levels.INFO)
			end,
			desc = 'Snacks bufdelete all',
		},
		{
			'<leader>bC',
			function()
				Snacks.bufdelete.other()
				vim.notify('Others buffers has been deleted', vim.log.levels.INFO)
			end,
			desc = 'Snacks bufdelete all but current',
		},
	},
}
