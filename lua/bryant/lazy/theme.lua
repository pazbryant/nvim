local themes = {
	{
		'catppuccin/nvim',
		enabled = true,
		lazy = false,
		name = 'catppuccin',
		priority = 1000,
		config = function()
			require('catppuccin').setup({
				flavour = 'frappe',
				background = {
					dark = 'frappe',
				},
				no_italic = false,
				no_bold = false,
				no_underline = false,
				styles = {
					comments = { 'italic' },
					conditionals = { 'italic' },
					loops = {},
					functions = {},
					keywords = {},
					strings = {},
					variables = {},
					numbers = {},
					booleans = {},
					properties = {},
					types = {},
					operators = {},
					-- miscs = {}, -- Uncomment to turn off hard-coded styles
				},
			})
			vim.cmd([[colorscheme catppuccin]])
		end,
	},

	{
		'rose-pine/neovim',
		enabled = true,
		name = 'rose-pine',
		lazy = true,
		priority = 1000,
		config = function()
			require('rose-pine').setup({
				variant = 'main', -- main, moon, or dawn
				dark_variant = 'main', -- main, moon
				styles = {
					italic = false,
					transparency = false,
				},
			})
			vim.cmd([[colorscheme rose-pine]])
		end,
	},

	{
		'maxmx03/solarized.nvim',
		enabled = true,
		lazy = true,
		priority = 1000,
		opts = {
			theme = 'neo',
		},
		config = function(_, opts)
			vim.o.background = 'dark' -- or 'light'
			vim.cmd([[colorscheme solarized]])
			require('solarized').setup(opts)
		end,
	},

	{
		'craftzdog/solarized-osaka.nvim',
		enabled = true,
		lazy = true,
		priority = 1000,
		config = function()
			require('solarized-osaka').setup({
				transparent = false,
			})
			vim.cmd([[colorscheme solarized-osaka]])
		end,
	},
}

return themes
