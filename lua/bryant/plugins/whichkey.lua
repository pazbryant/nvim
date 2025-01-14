return {
	'folke/which-key.nvim',
	event = 'VeryLazy',
	config = function()
		local wk = require('which-key')
		wk.add({})
	end,
	keys = {
		-- stylua: ignore start
		{ '<leader>?', function() require('which-key').show({ global = false }) end, desc = 'Buffer Local Keymaps (which-key)' },
	},
}
