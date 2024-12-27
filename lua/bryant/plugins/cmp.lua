return {
	'hrsh7th/nvim-cmp',
	event = 'InsertEnter',
	dependencies = {
		{
			'L3MON4D3/LuaSnip',
			build = 'make install_jsregexp',
			config = function()
				require('luasnip.loaders.from_lua').lazy_load() -- Optionally load custom snippets if you have them
			end,
		},
		{
			'windwp/nvim-autopairs',
			event = 'InsertEnter',
			config = function()
				require('nvim-autopairs').setup({
					fast_wrap = {},
					disable_filetype = { 'TelescopePrompt', 'vim' },
				})
				local cmp_autopairs = require('nvim-autopairs.completion.cmp')
				require('cmp').event:on('confirm_done', cmp_autopairs.on_confirm_done())
			end,
		},
		'hrsh7th/cmp-emoji', -- Emoji completion
		'hrsh7th/cmp-buffer', -- Buffer completion
		'hrsh7th/cmp-path', -- Path completion
	},
	config = function()
		local cmp = require('cmp')
		local luasnip = require('luasnip')
		local cmp_types = require('cmp.types')

		cmp.setup({
			snippet = {
				expand = function(args)
					-- Use LuaSnip's expansion function (only if you're using LuaSnip snippets)
					luasnip.lsp_expand(args.body) -- You can replace this if you use custom LuaSnip expansions
				end,
			},
			completion = {
				completeopt = 'menu,menuone,noinsert',
			},
			preselect = cmp.PreselectMode.None,
			mapping = cmp.mapping.preset.insert({
				['<C-n>'] = cmp.mapping.select_next_item(),
				['<C-p>'] = cmp.mapping.select_prev_item(),
				['<C-y>'] = cmp.mapping.confirm({ select = true }),
				['<C-Space>'] = cmp.mapping.complete({}),
				['<C-l>'] = cmp.mapping(function()
					if luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					end
				end, { 'i', 's' }),
				['<C-h>'] = cmp.mapping(function()
					if luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					end
				end, { 'i', 's' }),
				['<C-b>'] = cmp.mapping.scroll_docs(-4),
				['<C-f>'] = cmp.mapping.scroll_docs(4),
			}),
			sources = {
				{ name = 'emoji', max_item_count = 5 },
				{ name = 'buffer', max_item_count = 5 },
				{ name = 'path', max_item_count = 5 },
			},
		})
	end,
}
