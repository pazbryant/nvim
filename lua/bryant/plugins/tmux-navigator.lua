return {
	'christoomey/vim-tmux-navigator',
	lazy = false,
	init = function()
		vim.g.tmux_navigator_no_mappings = 1
		vim.g.tmux_navigator_disable_when_zoomed = 1

		local keymap = vim.keymap.set
		keymap('n', '<C-k>', ':<C-U>TmuxNavigateUp<CR>', { silent = true })
		keymap('n', '<C-j>', ':<C-U>TmuxNavigateDown<CR>', { silent = true })
		keymap('n', '<C-h>', ':<C-U>TmuxNavigateLeft<CR>', { silent = true })
		keymap('n', '<C-l>', ':<C-U>TmuxNavigateRight<CR>', { silent = true })
		keymap('n', '<c-\\>', ':<C-U>TmuxNavigatePrevious<CR>', { silent = true })
	end,
}
