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
		map({ 'n', 'o' }, 'gr', function() require('leap.remote').action() end, {desc="Leap remote mode"})
		map({ 'n', 'x', 'o' }, 'gs', function() require('leap.treesitter').select() end, { desc = 'Leap treesitter selection' })
		require('leap').opts.equivalence_classes =
			{ ' \t\r\n', '([{', ')]}', '\'"`' }
	end,
}
