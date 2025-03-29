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

				ls.filetype_extend('javascript', { 'javascriptreact' })
				ls.filetype_extend('typescript', { 'javascript' })
				ls.filetype_extend('typescriptreact', { 'javascript', 'typescript' })
			end,
		},
	},
	opts = {
		cmdline = { enabled = false },
		completion = {
			documentation = { auto_show = true, auto_show_delay_ms = 500 },
		},
		sources = {
			default = { 'lazydev', 'lsp', 'path', 'buffer', 'snippets' },
			providers = {
				lazydev = {
					name = 'LazyDev',
					module = 'lazydev.integrations.blink',
					score_offset = 100,
				},
			},
		},
		fuzzy = { implementation = 'prefer_rust_with_warning' },
		snippets = { preset = 'luasnip' },
		signature = { enabled = true },
	},
	opts_extend = { 'sources.default' },
}
