return {
	'christoomey/vim-tmux-navigator',
	cmd = {
		'TmuxNavigateLeft',
		'TmuxNavigateDown',
		'TmuxNavigateUp',
		'TmuxNavigateRight',
		'TmuxNavigatePrevious',
	},
	keys = {
		{ '<C-h>', '<cmd><C-U>TmuxNavigateLeft<cr>', desc = 'Tmux left' },
		{ '<C-j>', '<cmd><C-U>TmuxNavigateDown<cr>', desc = 'Tmux down' },
		{ '<C-k>', '<cmd><C-U>TmuxNavigateUp<cr>', desc = 'Tmux up' },
		{ '<C-l>', '<cmd><C-U>TmuxNavigateRight<cr>', desc = 'Tmux right' },
	},
}
