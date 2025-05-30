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
      { "<c-l>", function() harpoon2_list:next() end, desc = 'Harpoon next' },
      { "<c-h>", function() harpoon2_list:prev() end, desc = 'Harpoon previous' },
      { '<leader>[', function() harpoon2_list:select(1) end, desc = 'Harpoon to file 1' },
      { '<leader>{', function() harpoon2_list:select(2) end, desc = 'Harpoon to file 2' },
      { '<leader>(', function() harpoon2_list:select(3) end, desc = 'Harpoon to file 3' },
      { '<leader>%', function() harpoon2_list:select(4) end, desc = 'Harpoon to file 4' },
      { '<c-e>', function() harpoon2.ui:toggle_quick_menu(harpoon2:list()) end, desc = 'Harpoon quick menu' },
      { '<c-n>', function() harpoon2_list:add() vim.notify('harpoon file added', vim.log.levels.INFO) end, desc = 'Harpoon add file' },
		}
	end,
}
