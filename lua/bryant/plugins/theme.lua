local themes = {
	{
		'projekt0n/github-nvim-theme',
		-- lazy = false,
		-- priority = 1000,
		enabled = true,
		opts = {
			options = {},
		},
		config = function(_, opts)
			require('github-theme').setup(opts)
			-- vim.cmd.colorscheme('github_dark_colorblind')
		end,
	},
	{
		'maxmx03/solarized.nvim',
		enabled = true,
		lazy = false,
		priority = 1000,
		config = function()
			vim.o.termguicolors = true
			vim.o.background = 'dark'
			require('solarized').setup({
				transparent = {
					enabled = true, -- Master switch to enable transparency
				},
				variant = 'winter', -- "spring" | "summer" | "autumn" | "winter" (default)
				styles = {
					comments = { italic = false, bold = false },
					functions = { italic = false },
					variables = { italic = false },
				},
			})
			vim.cmd.colorscheme('solarized')
		end,
	},
}

return themes
