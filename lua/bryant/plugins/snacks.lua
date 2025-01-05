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
		-- Enabled
		rename = { enabled = true },
		bigfile = { enabled = true },
		lazygit = { enable = true },
		indent = { enabled = true },
		quickfile = { enabled = true },
		zen = {
			enabled = true,
			toggles = { dim = false },
			on_open = function()
				vim.opt.foldcolumn = '0'
				vim.opt.nu = false
				vim.opt.relativenumber = false
				vim.diagnostic.config({
					virtual_text = false,
				})
			end,
			on_close = function()
				vim.opt.foldcolumn = '1'
				vim.opt.nu = true
				vim.opt.relativenumber = true
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
