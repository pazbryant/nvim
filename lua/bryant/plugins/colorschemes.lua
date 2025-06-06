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
		'rose-pine/neovim',
		config = function()
			require('rose-pine').setup({
				styles = {
					bold = true,
					italic = false,
					transparency = false,
				},
			})
			vim.cmd.colorscheme('rose-pine')
		end,
	},

	{
		'craftzdog/solarized-osaka.nvim',
		config = function()
			require('solarized-osaka').setup({
				transparent = false,
				styles = {
					comments = { italic = false },
					keywords = { italic = false },
				},
			})
			vim.cmd.colorscheme('solarized-osaka')
		end,
	},

	{
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
