return {
	'folke/flash.nvim',
	event = 'VeryLazy',
	keys = function()
		local flash = require('flash')
		return {
			{
				's',
				mode = { 'n', 'x', 'o' },
				function()
					flash.jump()
				end,
				desc = 'Flash',
			},
			{
				'ga',
				mode = { 'n', 'x', 'o' },
				function()
					flash.treesitter()
				end,
				desc = 'Flash Treesitter',
			},
			{
				'r',
				mode = 'o',
				function()
					flash.remote()
				end,
				desc = 'Flash Remote',
			},
		}
	end,
}
