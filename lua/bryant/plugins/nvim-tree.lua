return {
	'nvim-tree/nvim-tree.lua',
	cmd = 'NvimTreeToggle',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	opts = {
		view = {
			width = 50,
			side = 'left',
			adaptive_size = true,
			preserve_window_proportions = true,
		},
		git = {
			enable = false,
			ignore = true,
		},
		hijack_directories = {
			enable = false,
			auto_open = false,
		},
	},
	keys = {
		{
			'<leader>E',
			'<CMD>NvimTreeToggle<CR>',
			{ desc = 'NvimTree toggle' },
		},
	},
}
