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
			'<C-c>',
			function()
				require('fzf-lua').commands()
			end,
			desc = 'Commands',
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
