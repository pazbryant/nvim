return {
	'folke/trouble.nvim',
	cmd = 'Trouble',
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

		icons = nil,
	},
	-- stylua: ignore start
	keys = {
    { '<leader>x', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Trouble All Diagnostics' },
    { '<c-x>', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Trouble Buffer Diagnostics' },
	},
}
