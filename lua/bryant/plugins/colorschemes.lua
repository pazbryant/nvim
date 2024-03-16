return {
	{
		'Mofiqul/vscode.nvim',
		config = function()
			require('vscode').setup({
				transparent = false,
				italic_comments = false,
			})
			vim.cmd.colorscheme('vscode')
		end,
	},

	{
		'RRethy/base16-nvim',
		lazy = false,
		priority = 1000,
		config = function()
			require('base16-colorscheme').with_config({
				telescope = true,
				indentblankline = true,
				notify = true,
				ts_rainbow = true,
				cmp = true,
				illuminate = true,
				dapui = true,
			})

			vim.cmd('colorscheme base16-default-dark')
		end,
	},
}
