return {
	'folke/todo-comments.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	event = 'VimEnter',
	cmd = { 'TodoQuickFix' },
	opts = {
		gui_style = {
			fg = 'NONE', -- The gui style to use for the fg highlight group.
			bg = 'NONE', -- The gui style to use for the bg highlight group.
		},
	},
	keys = {
		-- stylua: ignore start
		{ '<m-t>', '<cmd> TodoQuickFix <CR>', desc = 'Todo Comments FZF-LUA' },
	},
}
