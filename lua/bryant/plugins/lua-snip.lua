return {
	'L3MON4D3/LuaSnip',
	dependencies = 'rafamadriz/friendly-snippets',
	config = function()
		require('luasnip.loaders.from_vscode').lazy_load({
			exclude = {
				'sh',
				'bash',
			},
		})
		require('luasnip.loaders.from_lua').lazy_load({
			paths = {
				'./snippets',
			},
		})
	end,
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
