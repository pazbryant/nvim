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
		{ '<m-h>', '<cmd>TmuxNavigateLeft<cr>', desc = 'Tmux left' },
		{ '<m-j>', '<cmd>TmuxNavigateDown<cr>', desc = 'Tmux down' },
		{ '<m-k>', '<cmd>TmuxNavigateUp<cr>', desc = 'Tmux up' },
		{ '<m-l>', '<cmd>TmuxNavigateRight<cr>', desc = 'Tmux right' },
	},
}
