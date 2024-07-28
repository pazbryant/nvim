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

	{
		'catppuccin/nvim',
		enabled = false,
		lazy = true,
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
		enabled = false,
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
}

return themes
