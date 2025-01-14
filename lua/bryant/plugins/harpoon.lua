return {
	'ThePrimeagen/harpoon',
	branch = 'harpoon2',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = true,
	keys = {
		-- stylua: ignore start
		{ '<leader>ha', function() require('harpoon'):list():add() end, desc = 'harpoon file' },
		{ '<leader>e', function() local harpoon = require('harpoon') harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = 'harpoon quick menu' },
		{ '<leader>[', function() require('harpoon'):list():select(1) end, desc = 'harpoon to file 1' },
		{ '<leader>{', function() require('harpoon'):list():select(2) end, desc = 'harpoon to file 2' },
		{ '<leader>(', function() require('harpoon'):list():select(3) end, desc = 'harpoon to file 3' },
		{ '<leader>%', function() require('harpoon'):list():select(4) end, desc = 'harpoon to file 4' },
		{ '<leader>1', function() require('harpoon'):list():select(5) end, desc = 'harpoon to file 5' },
		{ '<leader>2', function() require('harpoon'):list():select(6) end, desc = 'harpoon to file 6' },
		{ '<leader>3', function() require('harpoon'):list():select(7) end, desc = 'harpoon to file 7' },
		{ '<leader>4', function() require('harpoon'):list():select(8) end, desc = 'harpoon to file 8' },
	},
}
