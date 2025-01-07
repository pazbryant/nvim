return {
	'hrsh7th/nvim-cmp',
	event = 'InsertEnter',
	dependencies = {
		'onsails/lspkind.nvim',
		'hrsh7th/cmp-buffer', -- Buffer completion
		'hrsh7th/cmp-path', -- Path completion
		-- This is important for integrating LuaSnip with nvim-cmp
		'saadparwaiz1/cmp_luasnip',
		'L3MON4D3/LuaSnip',
	},
	config = function()
		local cmp = require('cmp')
		local luasnip = require('luasnip')
		local lspkind = require('lspkind')

		local formating_style = {
			format = lspkind.cmp_format({
				mode = 'text_symbol',
				maxwidth = 50,
				ellipsis_char = '...',
				show_labelDetails = true,
			}),
		}

		cmp.setup({
			formatting = formating_style,
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

				['<C-d>'] = cmp.mapping.scroll_docs(-4),
				['<C-u>'] = cmp.mapping.scroll_docs(4),

				['<C-e>'] = cmp.mapping(function()
					if cmp.visible() then
						cmp.abort()
					else
						cmp.complete()
					end
				end, { 'i', 'c' }),

				['<C-y>'] = cmp.mapping.confirm({ select = true }),
			}),
			sources = {
				{ name = 'luasnip' },
				{ name = 'buffer' },
				{ name = 'path' },
			},
		})
	end,
}
