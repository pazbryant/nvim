return {
	'echasnovski/mini.surround',
	version = '*',
	keys = {
		{ 'ys', desc = 'Mini.surround Add surrounding', mode = { 'n', 'v' } },
		{ 'ds', desc = 'Mini.surround Delete surrounding' },
		{ 'cs', desc = 'Mwnw.surround Replace surrounding' },
		{ 'yss', desc = 'Mini.surround Surround full line' },
	},
	config = function()
		require('mini.surround').setup({
			mappings = {
				add = 'ys',
				delete = 'ds',
				find = '',
				find_left = '',
				highlight = '',
				replace = 'cs',
				update_n_lines = '',
				suffix_last = 'l',
				suffix_next = 'n',
			},
			search_method = 'cover_or_next',
		})

		vim.keymap.del('x', 'ys')
		vim.keymap.set(
			'x',
			'S',
			[[:<C-u>lua MiniSurround.add('visual')<CR>]],
			{ silent = true }
		)

		vim.keymap.set('n', 'yss', 'ys_', { remap = true })
	end,
}
