local themes = {
	{
		'Mofiqul/vscode.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			local vscode_colors = require('vscode.colors')
			require('vscode').setup({
				italic_comments = true,
				disable_nvimtree_bg = true,
				color_overrides = {},
				group_overrides = {
					Cursor = { fg = vscode_colors.vscDarkBlue, bg = vscode_colors.vscLightGreen, bold = true },
				},
			})
			vim.cmd.colorscheme('vscode')
		end,
	},
	{
		'rose-pine/neovim',
		enabled = true,
		name = 'rose-pine',
		config = function()
			require('rose-pine').setup({
				variant = 'auto',
				styles = {
					bold = true,
					italic = false,
					transparency = false,
				},
			})
			vim.cmd('colorscheme rose-pine-main')
		end,
	},
	{
		'projekt0n/github-nvim-theme',
		enabled = true,
		opts = {
			options = {
				transparent = true,
			},
		},
		config = function(_, opts)
			require('github-theme').setup(opts)
		end,
	},
}

return themes
