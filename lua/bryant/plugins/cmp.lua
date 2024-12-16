return {
	'hrsh7th/nvim-cmp',
	event = 'InsertEnter',
	dependencies = {
		{
			'L3MON4D3/LuaSnip',
			build = 'make install_jsregexp', -- Corrected to just a string (no function wrapper)
			dependencies = 'rafamadriz/friendly-snippets',
			config = function()
				require('luasnip.loaders.from_vscode').lazy_load()
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
		-- Completion sources
		'onsails/lspkind.nvim',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-nvim-lua',
		'hrsh7th/cmp-path',
		'saadparwaiz1/cmp_luasnip', -- This is important for integrating LuaSnip with nvim-cmp
	},
	config = function()
		local cmp = require('cmp')
		local luasnip = require('luasnip')
		local cmp_types = require('cmp.types')
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
				['<M-b>'] = cmp.mapping.scroll_docs(-4),
				['<M-f>'] = cmp.mapping.scroll_docs(4),
			}),
			sources = {
				{
					name = 'lazydev',
					-- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
					group_index = 0,
				},
				{ name = 'nvim_lsp' },
				{ name = 'luasnip' },
				{ name = 'buffer' },
				{ name = 'nvim_lua' },
				{ name = 'path' },
			},
		})

		-- Toggle cmp custom function
		local usercmd = vim.api.nvim_create_user_command
		local enabled = true

		local function toggle_cmp()
			enabled = not enabled
			if enabled then
				cmp.setup({
					completion = {
						autocomplete = { cmp_types.cmp.TriggerEvent.TextChanged },
					},
				})
			else
				cmp.setup({
					completion = {
						autocomplete = false,
					},
				})
			end
		end

		usercmd('ToggleCMP', toggle_cmp, { nargs = 0 })
	end,
}
