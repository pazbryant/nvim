return {
	'ThePrimeagen/harpoon',
	branch = 'harpoon2',
	dependencies = { 'nvim-lua/plenary.nvim' },
	opts = {
		settings = {
			save_on_toggle = true,
		},
	},
	keys = function()
		local harpoon2 = require('harpoon')
		local harpoon2_list = harpoon2:list()

    -- stylua: ignore start
		return {
      { "<leader>hn", function() harpoon2_list:next() end, desc = 'harpoon next' },
      { "<leader>hp", function() harpoon2_list:prev() end, desc = 'harpoon previous' },
      { '<leader>%', function() harpoon2_list:select(2) end, desc = 'harpoon to file 2' },
      { '<leader>(', function() harpoon2_list:select(4) end, desc = 'harpoon to file 4' },
      { '<leader>{', function() harpoon2_list:select(3) end, desc = 'harpoon to file 3' },
      { '<leader>[', function() harpoon2_list:select(1) end, desc = 'harpoon to file 1' },
      { '<c-e>', function() harpoon2.ui:toggle_quick_menu(harpoon2:list()) end, desc = 'harpoon quick menu' },
      { '<leader>a', function() harpoon2_list:add() vim.notify('harpoon file added', vim.log.levels.INFO) end, desc = 'harpoon file' },
		}
	end,
}
