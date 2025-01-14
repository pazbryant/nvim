return {
	'tpope/vim-fugitive',
	event = 'VeryLazy',
	keys = {
		-- stylua: ignore start
		{ '<leader>gs', vim.cmd.Git, desc = 'Fugitive init' },
	},
}
