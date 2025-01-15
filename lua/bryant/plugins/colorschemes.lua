return {
	{
		'rebelot/kanagawa.nvim',
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
			vim.cmd.colorscheme('kanagawa')
		end,
	},

	{
		'rose-pine/neovim',
		name = 'rose-pine',
		opts = {
			variant = 'auto',
			bold_vert_split = true,
			styles = {
				bold = true,
				italic = false,
				transparency = false,
			},
		},
		config = function(_, opts)
			require('rose-pine').setup(opts)
			vim.cmd.colorscheme('rose-pine-main')
		end,
	},

	{
		'maxmx03/solarized.nvim',
		lazy = false,
		priority = 1000,
		opts = {
			transparent = {
				enabled = false, -- Master switch to enable transparency
			},
			variant = 'winter', -- "spring" | "summer" | "autumn" | "winter" (default)
			styles = {
				comments = { italic = false, bold = false },
				functions = { italic = false },
				variables = { italic = false },
			},
		},
		config = function(_, otps)
			require('solarized').setup(otps)
			vim.cmd.colorscheme('solarized')
		end,
	},
}
