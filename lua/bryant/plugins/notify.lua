return {
	'rcarriga/nvim-notify',
	event = 'UiEnter',
	init = function()
		vim.notify = require('notify')
	end,
	opts = {
		max_width = 40,
		top_down = true,
		render = 'compact', -- default,minimal,compact,simple,wrapped-compact
	},
	config = function(_, opts)
		require('notify').setup(opts)
	end,
	keys = {
		{
			'<leader>n',
			'<cmd>Notifications<CR>',
			desc = 'Show notifications',
		},
		{
			'<leader>N',
			'<cmd>NotificationsClear<CR>',
			desc = 'Clear notifications',
		},
	},
}
