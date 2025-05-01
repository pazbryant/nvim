return {
	{
		'bluz71/vim-moonfly-colors',
		lazy = false,
		priority = 1000,
		name = 'moonfly',
		config = function()
			vim.cmd.colorscheme('moonfly')
		end,
	},
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
			vim.cmd.colorscheme('zenbones')
		end,
	},
}
