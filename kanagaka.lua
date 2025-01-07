return {
	'rebelot/kanagawa.nvim',
	lazy = false,
	priority = 1000,
	opts = {
		compile = true,
		commentStyle = { italic = false },
		keywordStyle = { italic = false },
		statementStyle = { bold = true },
		transparent = false,
		theme = 'wave', -- Load "wave" theme when 'background' option is not set
		background = { -- map the value of 'background' option to a theme
			dark = 'wave', -- try "dragon" !
			light = 'lotus',
		},
	},
	config = function(_, opts)
		require('kanagawa').setup(opts)
	end,
}
