return {
	'tpope/vim-fugitive',
	event = 'VeryLazy',
	keys = {
		{ '<leader>gs', vim.cmd.Git, desc = 'Fugitive init' },
		{
			'<leader>gd',
			function()
				vim.cmd([[Gvdiffsplit!]])
				vim.notify('Resolving git conflicts', vim.log.levels.INFO)
			end,
			desc = 'Fugitive diff split',
		},
		{
			'<leader>go',
			function()
				vim.cmd([[diffget //2]])
				vim.notify('Git ours selected', vim.log.levels.INFO)
			end,
			desc = 'Fugitive ours changes',
		},
		{
			'<leader>gt',
			function()
				vim.cmd([[diffget //3]])
				vim.notify('Git theirs selected', vim.log.levels.INFO)
			end,
			desc = 'Fugitive ours changes',
		},
	},
}
