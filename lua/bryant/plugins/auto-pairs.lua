return {
	'windwp/nvim-autopairs',
	enabled = false,
	dependencies = 'hrsh7th/nvim-cmp',
	init = function()
		local cmp_autopairs = require('nvim-autopairs.completion.cmp')
		local cmp = require('cmp')
		cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
	end,
	opts = {
		check_ts = true,
		disable_filetype = { 'TelescopePrompt', 'grug-far', 'vim', 'query' },
		enable_check_bracket_line = true,
		ignored_next_char = '[%w%.<"(]',
	},
}
