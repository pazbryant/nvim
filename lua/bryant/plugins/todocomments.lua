return {
	'folke/todo-comments.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	event = 'VimEnter',
	cmd = { 'TodoQuickFix' },
	opts = {},
	keys = {
		-- stylua: ignore start
		{ '<leader>tq', '<cmd> TodoQuickFix <CR>', desc = 'Todo comments quick fix' },
	},
}
