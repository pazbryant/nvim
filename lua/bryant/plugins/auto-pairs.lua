return {
	'windwp/nvim-autopairs',
	dependencies = 'hrsh7th/nvim-cmp',
	init = function()
		local usercmd = vim.api.nvim_create_user_command
		usercmd('EnableAutoPair', function()
			local cmp_autopairs = require('nvim-autopairs.completion.cmp')
			local cmp = require('cmp')
			cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
		end, {
			desc = 'Start autopairs plugin',
		})
	end,
	config = {},
}
