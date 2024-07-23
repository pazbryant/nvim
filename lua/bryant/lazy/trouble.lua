return {
	'folke/trouble.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	opts = {
		auto_close = true,
		focus = true,
	},
	cmd = 'Trouble',
	keys = {
		{
			'<leader>x',
			'<cmd>Trouble diagnostics toggle<cr>',
			desc = 'Diagnostics (Trouble)',
		},
		{
			'<leader>X',
			'<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
			desc = 'Buffer Diagnostics (Trouble)',
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
		{
			'<leader>q',
			'<cmd>Trouble qflist toggle<cr>',
			desc = 'Quickfix List (Trouble)',
		},
	},
}
