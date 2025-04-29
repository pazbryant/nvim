return {
	'echasnovski/mini.pairs',
	enabled = false,
	event = 'InsertEnter',
	version = '*',
	config = function()
		require('mini.pairs').setup()
	end,
}
