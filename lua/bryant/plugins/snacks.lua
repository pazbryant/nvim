return {
	'folke/snacks.nvim',
	lazy = false,
	priority = 1000,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		scratch = { enabled = false },
		profiler = { enabled = false },
		debug = { enabled = false },
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
		scope = { enabled = false },
		notifier = { enabled = false },
		notify = { enabled = false },
		rename = { enabled = false },
		animate = { enabled = false },
		-- Enabled
		indent = { enabled = true },
		bigfile = { enabled = true },
		lazygit = { enable = true },
		quickfile = { enabled = true },
		zen = {
			enabled = true,
			toggles = { dim = false },
			on_open = function()
				vim.opt.foldcolumn = '0'
				vim.diagnostic.config({
					virtual_text = false,
				})
			end,
			on_close = function()
				vim.opt.foldcolumn = '1'
				vim.diagnostic.config({
					virtual_text = true,
				})
			end,
		},
		styles = {
			zen = {
				width = 100,
				backdrop = {
					transparent = true,
					blend = 20,
				},
			},
		},
	},
	keys = {
		{
			'<leader>zm',
			function()
				Snacks.zen()
			end,
			desc = 'Toggle Zen Mode',
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
