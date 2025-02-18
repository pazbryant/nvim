return {
	{
		'Mofiqul/vscode.nvim',
		config = function()
			vim.cmd.colorscheme('vscode')
		end,
	},

	{
		'zenbones-theme/zenbones.nvim',
		dependencies = 'rktjmp/lush.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme zenbones]])
		end,
	},
}
