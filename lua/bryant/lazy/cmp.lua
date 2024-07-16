return {
	'hrsh7th/nvim-cmp',
	event = 'InsertEnter',
	dependencies = {
		{
			'L3MON4D3/LuaSnip',
			build = (function()
				return 'make install_jsregexp'
			end)(),
			dependencies = { 'rafamadriz/friendly-snippets' },
			config = function()
				require('luasnip.loaders.from_vscode').lazy_load({})
			end,
		},
		-- sources
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'saadparwaiz1/cmp_luasnip',
	},
	config = function()
		local cmp = require('cmp')
		local luasnip = require('luasnip')
		local cmp_types = require('cmp.types')

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			completion = {
				completeopt = 'menu,menuone,noinsert',
			},
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
			}),
			sources = {
				{ name = 'luasnip' },
				{ name = 'buffer' },
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
						autocomplete = {
							cmp_types.cmp.TriggerEvent.TextChanged,
						},
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

		usercmd('CmpToggle', toggle_cmp, { nargs = 0 })
	end,
}
