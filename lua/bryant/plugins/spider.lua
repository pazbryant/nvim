return {
	'chrisgrieser/nvim-spider',
	opts = {
		skipInsignificantPunctuation = true,
	},
	keys = {
		-- stylua: ignore start
		{ 'b', "<cmd>lua require('spider').motion('b')<CR>", mode = { 'n', 'o', 'x' } },
		{ 'w', "<cmd>lua require('spider').motion('w')<CR>", mode = { 'n', 'o', 'x' } },
		{ 'e', "<cmd>lua require('spider').motion('e')<CR>", mode = { 'n', 'o', 'x' } },
	},
}
