return {
	'christoomey/vim-tmux-navigator',
	lazy = false,
	init = function()
		vim.g.tmux_navigator_no_mappings = 1
		vim.g.tmux_navigator_disable_when_zoomed = 1

		local keymap = vim.keymap.set
		keymap('n', '<A-k>', ':<C-U>TmuxNavigateUp<CR>', { silent = true })
		keymap('n', '<A-j>', ':<C-U>TmuxNavigateDown<CR>', { silent = true })
		keymap('n', '<A-h>', ':<C-U>TmuxNavigateLeft<CR>', { silent = true })
		keymap('n', '<A-l>', ':<C-U>TmuxNavigateRight<CR>', { silent = true })
		keymap('n', '<A-p>', ':<C-U>TmuxNavigatePrevious<CR>', { silent = true })
	end,
}
