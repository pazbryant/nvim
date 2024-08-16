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
			vim.o.background = 'dark'
			require('vscode').setup(opts)
		end,
	},

	{
		'rose-pine/neovim',
		enabled = true,
		name = 'rose-pine',
		lazy = false,
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
