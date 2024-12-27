return {
	'chrisgrieser/nvim-spider',
	keys = {
		{
			'b',
			"<cmd>lua require('spider').otion('b')<CR>",
			mode = { 'n', 'o', 'x' },
		},
		{
			'w',
			"<cmd>lua require('spider').motion('w')<CR>",
			mode = { 'n', 'o', 'x' },
		},
		{
			'e',
			"<cmd>lua require('spider').motion('e')<CR>",
			mode = { 'n', 'o', 'x' },
		},
	},
}
