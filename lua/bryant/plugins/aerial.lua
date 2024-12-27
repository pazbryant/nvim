return {
	'stevearc/aerial.nvim',
	cmd = 'AerialToggle',
	dependencies = {
		'nvim-treesitter/nvim-treesitter',
		'nvim-tree/nvim-web-devicons',
	},
	keys = {
		{
			'<C-a>',
			'<cmd>AerialToggle!<CR>',
			desc = 'Toggle Aerial',
		},
	},
	config = function()
		require('aerial').setup({
			layout = {
				max_width = { 40, 0.2 },
				width = 40,
				min_width = 20,
				default_direction = 'prefer_left',
			},
			on_attach = function(bufnr)
				local map = vim.keymap.set
				map('n', '[a', '<cmd>AerialPrev<CR>', { buffer = bufnr })
				map('n', ']a', '<cmd>AerialNext<CR>', { buffer = bufnr })
			end,
		})
	end,
}
