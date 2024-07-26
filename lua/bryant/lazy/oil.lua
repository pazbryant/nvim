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
			['<C-CR>'] = 'actions.preview',
			['<leader>e'] = 'actions.close',
			['<M-r>'] = 'actions.refresh',
			['.'] = 'actions.parent',
			['gx'] = 'actions.open_external',
			[','] = 'actions.toggle_hidden',
		},
		use_default_keymaps = false,
	},
	keys = {
		{
			'<leader>e',
			'<cmd>Oil<CR>',
			desc = 'Open oil',
		},
	},
	config = function(_, opts)
		require('oil').setup(opts)
	end,
}
