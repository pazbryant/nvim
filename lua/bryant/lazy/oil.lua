return {
	'stevearc/oil.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	opts = {
		default_file_explorer = true,
		columns = {
			'icon',
			'permissions',
		},
		skip_confirm_for_simple_edits = false,
		keymaps = {
			['g?'] = 'actions.show_help',
			['<CR>'] = 'actions.select',
			['<M-CR>'] = 'actions.preview',
			['q'] = 'actions.close',
			['<M-r>'] = 'actions.refresh',
			['.'] = 'actions.parent',
			['gx'] = 'actions.open_external',
			[','] = 'actions.toggle_hidden',
		},
		use_default_keymaps = false,
		float = {
			padding = 4,
			max_width = 400,
			max_height = 0,
			border = 'rounded',
			win_options = {
				winblend = 0,
			},
		},
	},
	keys = {
		{
			'<C-e>',
			'<cmd>Oil<CR>',
			desc = 'Open oil',
		},
		{
			'<leader>E',
			'<cmd>Oil --float<CR>',
			desc = 'Open oil',
		},
	},
	config = function(_, opts)
		require('oil').setup(opts)
	end,
}
