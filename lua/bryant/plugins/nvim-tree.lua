return {
	'nvim-tree/nvim-tree.lua',
	cmd = 'NvimTreeToggle',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	opts = {
		view = {
			width = 60,
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
			'<leader>e',
			function()
				require('nvim-tree.api').tree.toggle({ focus = false })
			end,
			{ desc = 'NvimTree toggle' },
		},
	},
}
