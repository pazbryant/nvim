return {
	'folke/flash.nvim',
	lazy = false,
	opts = {
		search = {
			multi_window = false,
		},
		label = {
			style = 'overlay', ---@type "eol" | "overlay" | "right_align" | "inline"
		},
		highlight = {
			backdrop = false,
			matches = true,
			priority = 5000,
			groups = {
				match = 'FlashMatch',
				current = 'FlashCurrent',
				backdrop = 'FlashBackdrop',
				label = 'FlashLabel',
			},
		},
		modes = {
			char = {
				enabled = true,
				autohide = true,
				jump_labels = true,
				highlight = { backdrop = false },
			},
		},
	},
	keys = function()
		local flash = require('flash')
		return {
			{
				'<c-z>',
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
