return {
	'stevearc/oil.nvim',
	cmd = 'Oil',
	keys = {
		{ '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' } },
	},
	opts = {
		use_default_keymaps = true,
		delete_to_trash = true,
		columns = {},
		keymaps = {
			['<C-p>'] = 'actions.preview',
			['<C-r>'] = 'actions.refresh',
			['<C-l>'] = 'actions.select_vsplit',
			q = 'actions.close',
		},
	},
}
