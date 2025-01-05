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
	config = function()
		require('aerial').setup({
			layout = {
				max_width = { 40, 0.2 },
				width = 40,
				min_width = 20,
				default_direction = 'prefer_left',
			},
		})
	end,
	keys = {
		{
			'<C-a>',
			'<cmd>AerialToggle!<CR>',
			desc = 'Toggle Aerial',
		},
		{
			'[a',
			'<cmd>AerialPrev<CR>',
			desc = 'Aerial prev',
		},
		{
			']a',
			'<cmd>AerialNext<CR>',
			desc = 'Aerial next',
		},
	},
}
