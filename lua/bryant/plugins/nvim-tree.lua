return {
	'nvim-tree/nvim-tree.lua',
	cmd = 'NvimTreeToggle',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	opts = {
		view = {
			width = 55,
			side = 'left',
			adaptive_size = true,
			preserve_window_proportions = true,
		},
		git = {
			enable = false,
			ignore = true,
		},
	},
	keys = {
		{
			'<leader>E',
			'<CMD>NvimTreeToggle<CR>',
			{ desc = 'Toggle Nvim Tree' },
		},
	},
	config = function(_, opts)
		require('nvim-tree').setup(opts)
	end,
}
