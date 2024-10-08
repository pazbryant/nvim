local themes = {
	{
		'projekt0n/github-nvim-theme',
		enabled = true,
		lazy = false,
		priority = 1000,
		opts = {
			options = {
				transparent = false,
			},
		},
		config = function(_, opts)
			require('github-theme').setup(opts)
			vim.cmd([[colorscheme github_dark]])
		end,
	},
}

return themes
