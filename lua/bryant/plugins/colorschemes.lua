return {
	{
		'Mofiqul/vscode.nvim',
		config = function()
			vim.cmd.colorscheme('vscode')
		end,
	},
	{
		'rebelot/kanagawa.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			require('kanagawa').setup({
				compile = true,
				theme = 'wave',
				commentStyle = { italic = false },
				keywordStyle = { italic = false },
				statementStyle = { bold = true },
			})
			vim.cmd.colorscheme('kanagawa')
		end,
	},
}
