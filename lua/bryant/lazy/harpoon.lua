return {
	'ThePrimeagen/harpoon',
	branch = 'harpoon2',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = true,
	keys = {
		{
			'<C-s>',
			function()
				require('harpoon'):list():add()
			end,
			desc = 'harpoon file',
		},
		{
			'<C-e>',
			function()
				local harpoon = require('harpoon')
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end,
			desc = 'harpoon quick menu',
		},
		{
			'<C-h>',
			function()
				require('harpoon'):list():select(1)
			end,
			desc = 'harpoon to file 1',
		},
		{
			'<C-l>',
			function()
				require('harpoon'):list():select(2)
			end,
			desc = 'harpoon to file 4',
		},
	},
}
