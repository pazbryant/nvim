return {
	{
		'Mofiqul/vscode.nvim',
		config = function()
			vim.cmd.colorscheme('vscode')
		end,
	},

	{
		'bluz71/vim-moonfly-colors',
		name = 'moonfly',
		config = function()
			vim.cmd.colorscheme('moonfly')
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
}
