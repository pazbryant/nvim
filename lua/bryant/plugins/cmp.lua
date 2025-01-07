return {
	'hrsh7th/nvim-cmp',
	event = 'InsertEnter',
	dependencies = {
		-- Completion sources
		'onsails/lspkind.nvim',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-path',
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

		local disabled_snippet_lsps = {
			bashls = true, -- Add language servers you want to disable snippets for
		}

		cmp.setup({
			formatting = formating_style,
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body) -- Expands LuaSnip snippets
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
				{
					name = 'lazydev',
					-- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
					group_index = 0,
				},
				{ name = 'luasnip' },
				{
					name = 'nvim_lsp',
					entry_filter = function(entry)
						local source = entry.source
						if source and source.source.client then
							local client_name = source.source.client.name
							if disabled_snippet_lsps[client_name] then
								local kind = require('cmp.types').lsp.CompletionItemKind[entry:get_kind()]
								return kind ~= 'Snippet'
							end
						end
						return true -- Allow other entries
					end,
				},
				{ name = 'buffer' },
				{ name = 'path' },
			},
		})
	end,
}
