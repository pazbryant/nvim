return {
	{
		'Mofiqul/vscode.nvim',
		config = function()
			vim.cmd.colorscheme('vscode')
		end,
	},

	{
		'zenbones-theme/zenbones.nvim',
		lazy = false,
		priority = 100,
		dependencies = 'rktjmp/lush.nvim',
		config = function()
			vim.cmd.colorscheme('zenbones')
			vim.cmd([[
      augroup MyColorSchemeTweaks
        autocmd!
        autocmd ColorScheme zenbones lua MyZenbonesTweaks()
      augroup END
    ]])

			function MyZenbonesTweaks()
				if vim.o.background == 'light' then
					vim.api.nvim_set_hl(0, 'Constant', { fg = '#556570' })
					vim.api.nvim_set_hl(0, 'Number', { fg = '#2c363c' })
				else
					vim.api.nvim_set_hl(0, 'Constant', { fg = '#868C91' })
					vim.api.nvim_set_hl(0, 'Number', { fg = '#B4BDC3' })
				end
			end

			MyZenbonesTweaks()
		end,
	},

	{
		'rebelot/kanagawa.nvim',
		config = function()
			require('kanagawa').setup({
				compile = true,
				commentStyle = { italic = false },
				keywordStyle = { italic = false },
			})
			vim.cmd([[colorscheme kanagawa]])
		end,
	},
}
