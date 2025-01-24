return {
	'folke/snacks.nvim',
	lazy = false,
	priority = 1000,
	opts = {
		indent = { enabled = true },
		bigfile = { enabled = true },
		lazygit = { enable = true },
		quickfile = { enabled = true },
	},
	keys = {
		-- stylua: ignore start
		{ '<leader>gg', function() Snacks.lazygit() end, desc = 'Lazygit' },
	},
}
