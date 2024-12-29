local themes = {

	{
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
	},

	{
		'rose-pine/neovim',
		lazy = false,
		priority = 1000,
		name = 'rose-pine',
		opts = {
			variant = 'auto',
			bold_vert_split = true,
			styles = {
				bold = true,
				italic = true,
				transparency = true,
			},
		},
		config = function(_, opts)
			require('rose-pine').setup(opts)
			vim.cmd.colorscheme('rose-pine-main')
		end,
	},

	{
		'maxmx03/solarized.nvim',
		opts = {
			transparent = {
				enabled = true, -- Master switch to enable transparency
			},
			variant = 'winter', -- "spring" | "summer" | "autumn" | "winter" (default)
			styles = {
				comments = { italic = true, bold = false },
				functions = { italic = true },
				variables = { italic = true },
			},
		},
		config = function(_, otps)
			require('solarized').setup(otps)
			vim.cmd.colorscheme('solarized')
		end,
	},
}

return themes
