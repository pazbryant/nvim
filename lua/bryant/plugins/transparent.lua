-- Optional, you don't have to run setup.
return {
	'xiyaowong/transparent.nvim',
	init = function()
		vim.cmd([[TransparentEnable]])
	end,
	cmd = {
		'TransparentEnable',
		'TransparentDisable',
		'TransparentToggle',
	},
	opts = {},
	keys = {
		{
			'<leader>tg',
			'<cmd>TransparentToggle<CR>',
			desc = 'Toggle transparency',
		},
	},
}
