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
		'zenbones-theme/zenbones.nvim',
		dependencies = 'rktjmp/lush.nvim',
		config = function()
			local lush = require('lush')
			local specs = lush.parse(function()
				return {
					Constant({ base.Constant, gui = '' }),
				}
			end)
			lush.apply(lush.compile(specs))
		end,
	},

	{
		lazy = false,
		priority = 1000,
		'rebelot/kanagawa.nvim',
		config = function()
			require('kanagawa').setup({
				commentStyle = { italic = false },
				keywordStyle = { italic = false },
			})
			vim.cmd.colorscheme('kanagawa')
		end,
	},
}
