return {
	'stevearc/aerial.nvim',
	cmd = {
		'AerialToggle',
		'AerialNext',
		'AerialPrev',
	},
	dependencies = {
		'nvim-treesitter/nvim-treesitter',
		'nvim-tree/nvim-web-devicons',
	},
	opts = {
		layout = {
			width = 40,
			min_width = 20,
			max_width = { 40, 0.2 },
			default_direction = 'prefer_left',
		},
		autojump = true,
		close_on_select = true,
	},
	-- stylua: ignore end
	keys = {
		{ ']a', '<cmd>AerialNext<CR>', desc = 'Aerial next' },
		{ '[a', '<cmd>AerialPrev<CR>', desc = 'Aerial prev' },
		{ '<m-a>', '<cmd>AerialToggle<CR>', desc = 'Toggle Aerial' },
	},
}
