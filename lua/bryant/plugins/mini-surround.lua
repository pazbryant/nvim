return {
	'echasnovski/mini.surround',
	version = '*',
	keys = {
		{ 'ys', desc = 'Mini.surround Add surrounding' },
		{ 'ds', desc = 'Mini.surround Delete surrounding' },
		{ 'cs', desc = 'Mwnw.surround Replace surrounding' },
		{ 'yss', desc = 'Mini.surround Surround full line' },
		{ 'S', desc = 'Mini.surround Add surrounding', mode = 'v' },
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

		-- stylua: ignore start
		local map = vim.keymap.set
		map('n', 'yss', 'ys_', { remap = true })
		map('x', 'S', [[:<C-u>lua MiniSurround.add('visual')<CR>]], { silent = true })
	end,
}
