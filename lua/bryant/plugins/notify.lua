return {
	'rcarriga/nvim-notify',
	event = 'UiEnter',
	init = function()
		vim.notify = require('notify')
	end,
	opts = {
		max_width = 30,
		top_down = true,
		render = 'wrapped-compact', -- default,minimal,compact,simple,wrapped-compact
	},
	keys = {
		{
			'<leader>n',
			'<cmd>Notifications<cr>',
			desc = 'Show notifications',
		},
		{
			'<leader>N',
			'<cmd>NotificationsClear<cr>',
			desc = 'Clear notifications',
		},
	},
}
