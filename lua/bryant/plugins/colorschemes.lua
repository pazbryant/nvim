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
		'Mofiqul/vscode.nvim',
		priority = 1000,
		config = function()
			vim.cmd.colorscheme('vscode')
		end,
	},

	{
		'mcchrish/zenbones.nvim',
		dependencies = 'rktjmp/lush.nvim',
		config = function()
			vim.cmd.colorscheme('zenbones')
			vim.cmd([[
      augroup MyColorSchemeTweaks
        autocmd!
        autocmd ColorScheme zenbones lua MyZenbonesTweaks()
      augroup END
    ]])

			function NonItalicZenbone()
				if vim.o.background == 'light' then
					vim.api.nvim_set_hl(0, 'Constant', { fg = '#556570' })
					vim.api.nvim_set_hl(0, 'Number', { fg = '#2c363c' })
				else
					vim.api.nvim_set_hl(0, 'Constant', { fg = '#868C91' })
					vim.api.nvim_set_hl(0, 'Number', { fg = '#B4BDC3' })
				end
			end

			NonItalicZenbone()
		end,
	},
}
