return {
	'folke/flash.nvim',
	lazy = false,
	keys = function()
		local flash = require('flash')
		return {
			{
				'<cr>',
				mode = { 'n', 'x', 'o' },
				function()
					flash.jump()
				end,
				desc = 'Flash',
			},
			{
				'gs',
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
