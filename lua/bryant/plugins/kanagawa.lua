return {
	'rebelot/kanagawa.nvim',
	opts = {
		compile = true,
		commentStyle = { italic = true },
		keywordStyle = { italic = true },
		statementStyle = { bold = true },
		transparent = true,
		theme = 'wave', -- Load "wave" theme when 'background' option is not set
		background = { -- map the value of 'background' option to a theme
			dark = 'wave', -- try "dragon" !
			light = 'lotus',
		},
	},
	config = function(_, opts)
		require('kanagawa').setup(opts)
		vim.cmd.colorscheme('kanagawa')
	end,
}
