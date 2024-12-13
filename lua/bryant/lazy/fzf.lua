return {
	'ibhagwan/fzf-lua',
	enabled = true,
	cmd = { 'FzfLua' },
	keys = {
		{
			'<C-t>',
			function()
				require('fzf-lua').live_grep_native()
			end,
			desc = 'Live grep',
		},
		{
			mode = 'x',
			'<C-t>',
			"<cmd>lua require('fzf-lua').grep_visual()<cr>",
			desc = 'Live grep',
		},
		{
			'<M-c>',
			function()
				require('fzf-lua').files()
			end,
			desc = 'Files',
		},
		{
			'<M-h>',
			function()
				require('fzf-lua').help_tags()
			end,
			desc = 'Help tags',
		},
		{
			'z=',
			function()
				require('fzf-lua').spell_suggest()
			end,
		},
	},
}
