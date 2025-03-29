return {
	'saghen/blink.cmp',
	event = 'InsertEnter',
	version = '1.*',
	dependencies = {
		'rafamadriz/friendly-snippets',
		{
			'L3MON4D3/LuaSnip',
			version = 'v2.*',
			config = function()
				local ls = require('luasnip')
				ls.config.set_config({
					history = true,
					updateevents = 'TextChanged,TextChangedI',
					enable_autosnippets = true,
				})
				require('luasnip.loaders.from_vscode').lazy_load({
					exclude = { 'sh', 'bash' },
				})
				require('luasnip.loaders.from_lua').lazy_load({
					paths = { './snippets' },
				})
			end,
		},
	},
	opts = {
		cmdline = { enabled = false },
		completion = {
			documentation = { auto_show = true, auto_show_delay_ms = 500 },
			menu = {
				draw = {
					columns = {
						{ 'label', 'label_description', gap = 1 },
						{ 'kind_icon', 'kind', gap = 1 },
					},
				},
			},
		},
		sources = {
			default = { 'lazydev', 'snippets', 'lsp', 'path', 'buffer' },
			providers = {
				snippets = {
					score_offset = 100,
				},
				lazydev = {
					name = 'LazyDev',
					module = 'lazydev.integrations.blink',
					score_offset = 100,
				},
			},
			transform_items = function(_, items)
				local wanted = {}
				for _, item in ipairs(items) do
					if
						not (
							item.kind
								== require('blink.cmp.types').CompletionItemKind.Snippet
							and item.source_id == 'lsp'
						)
					then
						wanted[#wanted + 1] = item
					end
				end
				return wanted
			end,
		},
		fuzzy = { implementation = 'prefer_rust_with_warning' },
		snippets = { preset = 'luasnip' },
		signature = { enabled = true },
	},
	opts_extend = { 'sources.default' },
}
