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
		'rebelot/kanagawa.nvim',
		config = function()
			require('kanagawa').setup({
				commentStyle = { italic = false },
				keywordStyle = { italic = false },
			})
			vim.cmd([[colorscheme kanagawa]])
		end,
	},
}
