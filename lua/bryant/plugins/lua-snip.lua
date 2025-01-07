local M = {
	'L3MON4D3/LuaSnip',
	keys = {
		{
			'<C-l>',
			function()
				return require('luasnip').jump(1)
			end,
			mode = { 'i', 's' },
		},
		{
			'<C-h>',
			function()
				require('luasnip').jump(-1)
			end,
			mode = { 'i', 's' },
		},
	},
}

M.config = function()
	local ls = require('luasnip')

	ls.setup({
		update_events = { 'TextChanged', 'TextChangedI' },
		delete_check_events = 'TextChanged',
	})

	require('luasnip.loaders.from_lua').lazy_load({ paths = { './snippets' } })
end

return M
