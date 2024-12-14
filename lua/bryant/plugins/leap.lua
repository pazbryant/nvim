return {
	'ggandor/leap.nvim',
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
	lazy = false,
	init = function()
		require('leap').create_default_mappings()

		-- Define equivalence classes for brackets and quotes, in addition to
		-- the default whitespace group.
		require('leap').opts.equivalence_classes =
			{ ' \t\r\n', '([{', ')]}', '\'"`' }

		-- Use the traversal keys to repeat the previous motion without explicitly
		-- invoking Leap.
		require('leap.user').set_repeat_keys('<enter>', '<backspace>')
	end,
}
