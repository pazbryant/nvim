return {
	'folke/todo-comments.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	event = 'VimEnter',
	cmd = { 'TodoLocList', 'TodoQuickFix' },
	opts = {},
	keys = {
		{
			'<M-t>',
			'<cmd> TodoTrouble <CR>',
			desc = 'Custom FZFLua Todo command',
		},
	},
}
