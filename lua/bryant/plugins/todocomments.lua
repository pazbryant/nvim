return {
	'folke/todo-comments.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	event = 'VimEnter',
	cmd = { 'TodoLocList', 'TodoQuickFix' },
	opts = {},
	keys = {
		{
			'<leader>tt',
			'<cmd> TodoTrouble <CR>',
			desc = 'Custom FZFLua Todo command',
		},
	},
}
