return {
	'xiyaowong/transparent.nvim',
	cmd = {
		'TransparentEnable',
		'TransparentDisable',
		'TransparentToggle',
	},
	opts = {
		groups = {
			'Normal',
			'NormalNC',
			'Comment',
			'Constant',
			'Special',
			'Identifier',
			'Statement',
			'PreProc',
			'Type',
			'Underlined',
			'Todo',
			'String',
			'Function',
			'Conditional',
			'Repeat',
			'Operator',
			'Structure',
			'LineNr',
			'NonText',
			'SignColumn',
			'CursorLine',
			'CursorLineNr',
			'StatusLine',
			'StatusLineNC',
			'EndOfBuffer',
		},
		-- table: additional groups that should be cleared
		extra_groups = {
			'NormalFloat',
			'NvimTreeNormal',
		},
		-- table: groups you don't want to clear
		exclude_groups = {},
		-- function: code to be executed after highlight groups are cleared
		-- Also the user event "TransparentClear" will be triggered
		on_clear = function() end,
	},
	keys = {
    -- stylua: ignore start
		{ '<leader>tt', '<cmd>TransparentToggle<cr>', desc = 'Transparent Toggle' },
	},
}
