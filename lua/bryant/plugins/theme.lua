local themes = {
	{
		'projekt0n/github-nvim-theme',
		-- lazy = false,
		-- priority = 1000,
		enabled = true,
		opts = {
			options = {
				transparent = true,
			},
		},
		config = function(_, opts)
			require('github-theme').setup(opts)
			-- vim.cmd.colorscheme('github_dark_colorblind')
		end,
	},
	{
		'Mofiqul/vscode.nvim',
		config = function()
			require('vscode').setup({
				transparent = true,
				italic_comments = true,
				disable_nvimtree_bg = true,
				color_overrides = {},
				group_overrides = {},
			})
			vim.cmd.colorscheme('vscode')
		end,
	},
	{
		'rose-pine/neovim',
		enabled = true,
		lazy = false,
		priority = 1000,
		name = 'rose-pine',
		config = function()
			require('rose-pine').setup({
				variant = 'auto',
				styles = {
					bold = true,
					italic = false,
					transparency = true,
				},
			})
			vim.cmd('colorscheme rose-pine-main')
		end,
	},
}

return themes
