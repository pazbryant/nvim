return {
	'mikavilpas/yazi.nvim',
	keys = {
		{
			'-',
			'<cmd>Yazi<cr>',
			desc = 'Open yazi at the current file',
		},
		{
			'<leader>cw',
			'<cmd>Yazi cwd<cr>',
			desc = "Open the file manager in nvim's working directory",
		},
	},
	opts = {
		open_for_directories = true,
		floating_window_scaling_factor = 1,
		yazi_floating_window_border = 'none',
		keymaps = {
			show_help = '<f1>',
		},
	},
}
