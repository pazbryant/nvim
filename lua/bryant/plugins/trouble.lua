return {
	'folke/trouble.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	opts = {
		auto_close = true,
		focus = true,
		---@type trouble.Window.opts
		win = {
			size = {
				height = 20,
			},
		}, -- window options for the results window. Can be a split or a floating window.
		-- Window options for the preview window. Can be a split, floating window,
		-- or `main` to show the preview in the main editor window.
	},
	cmd = 'Trouble',
	keys = {
		{
			'<leader>x',
			'<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
			desc = 'Buffer Diagnostics (Trouble)',
		},
		{
			'<leader>X',
			'<cmd>Trouble diagnostics toggle<cr>',
			desc = 'Diagnostics (Trouble)',
		},
		{
			'<leader>cs',
			'<cmd>Trouble symbols toggle focus=false<cr>',
			desc = 'Symbols (Trouble)',
		},
		{
			'<leader>cl',
			'<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
			desc = 'LSP Definitions / references / ... (Trouble)',
		},
		{
			'<leader>l',
			'<cmd>Trouble loclist toggle<cr>',
			desc = 'Location List (Trouble)',
		},
	},
}
