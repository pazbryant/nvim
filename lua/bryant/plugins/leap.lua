return {
	'ggandor/leap.nvim',
	dependencies = {
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
		'tpope/vim-repeat',
	},
	lazy = false,
	init = function()
		local map = vim.keymap.set
		map('n', 's', '<Plug>(leap)')
		map('n', 'S', '<Plug>(leap-from-window)')
		map({ 'x', 'o' }, 's', '<Plug>(leap-forward)')
		map({ 'x', 'o' }, 'S', '<Plug>(leap-backward)')

		-- Define equivalence classes for brackets and quotes, in addition to
		-- the default whitespace group.
		require('leap').opts.equivalence_classes =
			{ ' \t\r\n', '([{', ')]}', '\'"`' }
	end,
}
