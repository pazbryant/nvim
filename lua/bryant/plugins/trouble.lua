return {
	'folke/trouble.nvim',
	cmd = 'Trouble',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	opts = {
		auto_close = true,
		focus = true,
		---@type trouble.Window.opts
		win = {
			size = {
				height = 15,
			},
		}, -- window options for the results window. Can be a split or a floating window.
		-- Window options for the preview window. Can be a split, floating window,
		-- or `main` to show the preview in the main editor window.
		keys = {
			['g?'] = 'help',
		},
	},
	-- stylua: ignore start
	keys = {
    { '<leader>q', '<cmd>Trouble qflist toggle<cr>', desc = 'Trouble quickfix' },
    { '<leader>X', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Diagnostics (Trouble)' },
    { '<leader>x', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Buffer Diagnostics (Trouble)' },
	},
}
