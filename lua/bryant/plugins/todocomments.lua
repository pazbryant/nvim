return {
	'folke/todo-comments.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	event = 'VimEnter',
	cmd = { 'TodoLocList', 'TodoQuickFix' },
	opts = {},
	keys = {
		-- stylua: ignore start
		{ '<leader>tt', '<cmd> TodoTrouble <CR>', desc = 'Custom FZFLua Todo command' },
	},
}
