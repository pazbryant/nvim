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
		map({'n', 'x', 'o'}, 's',  '<Plug>(leap)', { desc = "Leap forward" } )
		map({'n', 'x', 'o'}, 'gs', '<Plug>(leap-from-window)' , { desc = "Leap to another window" } )
		map({ 'n', 'x', 'o' }, 'ga', function() require('leap.treesitter').select() end, { desc = 'Leap treesitter selection' })

		require('leap').opts.equivalence_classes =
			{ ' \t\r\n', '([{', ')]}', '\'"`' }

		require('leap.user').set_repeat_keys('<enter>', '<backspace>')
		require('leap').opts.preview_filter = function () return false end
		vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })
	end,
}
