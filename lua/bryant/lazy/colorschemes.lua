local themes = {
	{
		'projekt0n/github-nvim-theme',
		enabled = true,
		lazy = false,
		priority = 1000,
		config = function(_, opts)
			vim.cmd([[colorscheme github_light_colorblind]])
			require('github-theme').setup(opts)
		end,
	},
}

return themes
