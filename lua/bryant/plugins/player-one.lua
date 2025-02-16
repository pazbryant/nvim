return {
	'jackplus-xyz/player-one.nvim',
	lazy = false,
	config = function()
		local Config = require('player-one.config')
		Config.setup({
			is_enabled = true,
		})
	end,
}
