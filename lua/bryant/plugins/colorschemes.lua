return {
	{
		'Mofiqul/vscode.nvim',
		config = function()
			vim.cmd.colorscheme('vscode')
		end,
	},
	{
		'bluz71/vim-moonfly-colors',
		name = 'moonfly',
		config = function()
			vim.cmd.colorscheme('moonfly')
		end,
	},
	{
		'zenbones-theme/zenbones.nvim',
		lazy = false,
		priority = 1000,
		dependencies = 'rktjmp/lush.nvim',
		config = function()
			vim.cmd.colorscheme('zenbones')
		end,
	},
}
