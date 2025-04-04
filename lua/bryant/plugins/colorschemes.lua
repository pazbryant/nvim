return {
	{
		'Mofiqul/vscode.nvim',
		config = function()
			vim.cmd.colorscheme('vscode')
		end,
	},

	{
		'bluz71/vim-moonfly-colors',
		lazy = false,
		name = 'moonfly',
		config = function()
			vim.cmd.colorscheme('moonfly')
		end,
	},
}
