return {
	'folke/flash.nvim',
	event = 'VeryLazy',
	---@type Flash.Config
	opts = {},
	keys = {
		-- stylua: ignore start
		{ '<cr>', mode = { 'n', 'x', 'o' }, function() require('flash').jump() end, desc = 'Flash' },
		{ 'S', mode = { 'n', 'x', 'o' }, function() require('flash').treesitter() end, desc = 'Flash Treesitter' },
		{ 'r', mode = 'o', function() require('flash').remote() end, desc = 'Flash Remote' },
	},
}
