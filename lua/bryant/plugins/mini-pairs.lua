return {
	'echasnovski/mini.pairs',
	enabled = true,
	event = 'InsertEnter',
	version = '*',
	config = function()
		require('mini.pairs').setup()
	end,
}
