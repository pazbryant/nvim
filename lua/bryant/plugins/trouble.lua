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
			['?'] = 'help',
		},
	},
	-- stylua: ignore start
	keys = {
    { '<leader>xg', '<cmd>Trouble fzf<cr>', desc = 'Trouble fzf grep' },
    { '<leader>xf', '<cmd>Trouble fzf_files<cr>', desc = 'Trouble fzf files' },
    { '<leader>q', '<cmd>Trouble qflist toggle<cr>', desc = 'Trouble quickfix' },
    { '<leader>xX', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Diagnostics (Trouble)' },
    { '<leader>xx', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Buffer Diagnostics (Trouble)' },
	},
}
