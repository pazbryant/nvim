return {
	'folke/snacks.nvim',
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		animate = { enabled = false },
		scratch = { enabled = false },
		profiler = { enabled = false },
		debug = { enabled = false },
		dim = { enabled = false },
		git = { enabled = false },
		gitbrowse = { enabled = false },
		bufdelete = { enabled = false },
		terminal = { enabled = false },
		toggle = { enabled = false },
		util = { enabled = false },
		win = { enabled = false },
		scroll = { enabled = false },
		statuscolumn = { enabled = false },
		dim = { enabled = false },
		-- Enabled
		rename = { enabled = true },
		bigfile = { enabled = true },
		lazygit = { enable = true },
		indent = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		notifier = { enabled = true, timeout = 3000 },
		notify = { enabled = true },
		zen = {
			enabled = true,
			toggles = { dim = false },
		},
		styles = {
			zen = {
				backdrop = { transparent = true, blend = 20 },
			},
		},
	},
	keys = {
		{
			'zm',
			function()
				Snacks.zen()
			end,
			desc = 'Toggle Zen Mode',
		},
		{
			'<leader>dn',
			function()
				Snacks.notifier.hide()
			end,
			desc = 'Dismiss All Notifications',
		},
		{
			'<leader>n',
			function()
				Snacks.notifier.show_history()
			end,
			desc = 'Notification History',
		},
		{
			'<leader>rf',
			function()
				Snacks.rename.rename_file()
			end,
			desc = 'Rename File',
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
