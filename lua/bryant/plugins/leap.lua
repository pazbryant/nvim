return {
	'ggandor/leap.nvim',
	lazy = false,
	dependencies = {
		'tpope/vim-repeat',
		{
			'ggandor/flit.nvim',
			config = true,
			keys = {
				{ mode = { 'n', 'o', 'x' }, 't' },
				{ mode = { 'n', 'o', 'x' }, 'T' },
				{ mode = { 'n', 'o', 'x' }, 'f' },
				{ mode = { 'n', 'o', 'x' }, 'F' },
			},
		},
	},
	init = function()
		local map = vim.keymap.set
		map('n', '<cr>', '<Plug>(leap)')
		map({ 'x', 'o' }, '<cr>', '<Plug>(leap-forward)')
		map({ 'x', 'o' }, 'S', '<Plug>(leap-backward)')

		-- Define equivalence classes for brackets and quotes, in addition to
		-- the default whitespace group.
		require('leap').opts.equivalence_classes =
			{ ' \t\r\n', '([{', ')]}', '\'"`' }
	end,
}
