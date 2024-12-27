-- Optional, you don't have to run setup.
return {
	'xiyaowong/transparent.nvim',
	cmd = { 'TransparentEnable', 'TransparentDisable', 'TransparentToggle' },
	opts = {},
	keys = {
		{
			'<leader>tg',
			'<cmd>TransparentToggle<CR>',
			desc = 'Toggle transparency',
		},
	},
}
