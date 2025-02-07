return {
	{
		'rebelot/kanagawa.nvim',
		opts = {
			compile = true,
			commentStyle = { italic = false },
			keywordStyle = { italic = false },
			statementStyle = { bold = false },
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
		'sainnhe/everforest',
		config = function()
			vim.g.everforest_enable_italic = false
			vim.cmd.colorscheme('everforest')
		end,
	},

	{
		'rose-pine/neovim',
		name = 'rose-pine',
		opts = {
			variant = 'auto',
			bold_vert_split = true,
			styles = {
				bold = false,
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
	{
		'zenbones-theme/zenbones.nvim',
		dependencies = 'rktjmp/lush.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.zenbones_darken_comments = 45
			vim.cmd.colorscheme('zenwritten')
		end,
	},
}
