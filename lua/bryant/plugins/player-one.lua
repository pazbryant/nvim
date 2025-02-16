return {
	'jackplus-xyz/player-one.nvim',
	config = function()
		local Config = require('player-one.config')
		Config.setup({
			is_enabled = true,
		})
	end,
}
