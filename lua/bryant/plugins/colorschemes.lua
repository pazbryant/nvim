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
		config = function()
			vim.cmd([[colorscheme zenbones]])
		end,
	},

	{
		'catppuccin/nvim',
		name = 'catppuccin',
		config = function()
			vim.cmd([[colorscheme catppuccin]])
		end,
	},
}
