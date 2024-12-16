local themes = {
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
