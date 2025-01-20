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
		-- stylua: ignore start
		map('n', '<cr>', '<Plug>(leap)', { desc = 'Start leap' })
		map({ 'n', 'o' }, 'gr', function() require('leap.remote').action() end)
		map({ 'n', 'x', 'o' }, 'gA', 'V<cmd>lua require("leap.treesitter").select()<cr>', { desc = 'Leap selection line' })
		map({ 'n', 'x', 'o' }, 'ga', function() require('leap.treesitter').select() end, { desc = 'Leap treesitter selection' })

		-- Define equivalence classes for brackets and quotes, in addition to
		-- the default whitespace group.
		require('leap').opts.equivalence_classes =
			{ ' \t\r\n', '([{', ')]}', '\'"`' }
	end,
}
