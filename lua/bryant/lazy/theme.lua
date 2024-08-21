local themes = {
	{
		'Mofiqul/vscode.nvim',
		enabled = true,
		lazy = false,
		priority = 1000,
		opts = {
			transparent = false,
			italic_comments = true,
			underline_links = true,
			disable_nvimtree_bg = true,
		},
		config = function(_, opts)
			require('vscode').setup(opts)
			vim.o.background = 'dark'
			vim.cmd([[colorscheme vscode]])
		end,
	},

	{
		'rose-pine/neovim',
		enabled = true,
		name = 'rose-pine',
		lazy = false,
		priority = 1000,
		opts = {
			variant = 'main', -- main, moon, or dawn
			dark_variant = 'main', -- main, moon
			styles = {
				italic = false,
				transparency = false,
			},
		},
		config = function(_, opts)
			require('rose-pine').setup(opts)
		end,
	},

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
		end,
	},
}

return themes
