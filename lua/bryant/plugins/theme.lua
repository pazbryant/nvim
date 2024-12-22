local themes = {
	{
		'Mofiqul/vscode.nvim',
		config = function()
			require('vscode').setup({
				transparent = true,
				italic_comments = true,
				disable_nvimtree_bg = true,
				color_overrides = {},
				group_overrides = {},
			})
			vim.cmd.colorscheme('vscode')
		end,
	},
	{
		'rose-pine/neovim',
		lazy = false,
		priority = 1000,
		name = 'rose-pine',
		config = function()
			require('rose-pine').setup({
				variant = 'auto',
				bold_vert_split = true,
				styles = {
					bold = true,
					italic = true,
					transparency = true,
				},
			})
			vim.cmd.colorscheme('rose-pine-main')
		end,
	},

	{
		'rebelot/kanagawa.nvim',
		config = function()
			require('kanagawa').setup({
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
			})
			vim.cmd.colorscheme('kanagawa')
		end,
	},

	{
		'bluz71/vim-nightfly-colors',
		name = 'nightfly',
		config = function()
			vim.g.nightflyTransparent = true
			vim.cmd.colorscheme('nightfly')
		end,
	},

	{
		'maxmx03/solarized.nvim',
		config = function()
			vim.o.termguicolors = true
			vim.o.background = 'dark'
			require('solarized').setup({
				transparent = {
					enabled = true, -- Master switch to enable transparency
				},
				variant = 'winter', -- "spring" | "summer" | "autumn" | "winter" (default)
				styles = {
					comments = { italic = true, bold = false },
					functions = { italic = true },
					variables = { italic = true },
				},
			})
			vim.cmd.colorscheme('solarized')
		end,
	},
}

return themes
