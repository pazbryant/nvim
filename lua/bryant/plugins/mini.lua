return {
	{

		'echasnovski/mini.ai',
		version = '*',
		keys = {
			{ 'a', mode = { 'x', 'o' } },
			{ 'i', mode = { 'x', 'o' } },
		},
		dependencies = 'nvim-treesitter-textobjects',
		opts = function()
			local ai = require('mini.ai')
			return {
				n_lines = 500,

				mappings = {
					-- Main textobject prefixes
					around = 'a',
					inside = 'i',

					-- Next/last variants
					around_next = 'an',
					inside_next = 'in',
					around_last = 'al',
					inside_last = 'il',

					-- Move cursor to corresponding edge of `a` textobject
					goto_left = 'g[',
					goto_right = 'g]',
				},
				custom_textobjects = {
					o = ai.gen_spec.treesitter({
						a = { '@loop.outer', '@conditional.outer' },
						i = { '@loop.inner', '@conditional.inner' },
					}, {}),
					F = ai.gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }, {}),
					c = ai.gen_spec.treesitter({ a = '@class.outer', i = '@class.inner' }, {}),
				},
			}
		end,
	},

	{
		'echasnovski/mini.align',
		version = '*',
		keys = {
			{ 'ga', desc = 'Mini.align Align text' },
			{ 'gA', desc = 'Mini.align Align text with preview' },
		},
		opts = {},
	},

	{
		'echasnovski/mini.surround',
		version = '*',
		keys = {
			-- Here's a different mapping to avoid conflict with flash.nvim
			{ 'sa', desc = 'Mini.surround Add surrounding', mode = { 'n', 'v' } },
			{ 'sd', desc = 'Mini.surround Delete surrounding' },
			{ 'sf', desc = 'Mini.surround Find surrounding' },
			{ 'sF', desc = 'Mini.surround Find surrounding backward' },
			{ 'sh', desc = 'Mini.surround Highlight surrounding' },
			{ 'sr', desc = 'Mini.surround Replace surrounding' },
			{ 'sn', desc = 'Mini.surround Update n_lines' },
		},
		opts = {
			-- Custom mappings to avoid 's' conflict
			mappings = {
				add = 'sa', -- Add surrounding in Normal and Visual modes
				delete = 'sd', -- Delete surrounding
				find = 'sf', -- Find surrounding (to the right)
				find_left = 'sF', -- Find surrounding (to the left)
				highlight = 'sh', -- Highlight surrounding
				replace = 'sr', -- Replace surrounding
				update_n_lines = 'sn', -- Update `n_lines`

				suffix_last = 'l', -- Suffix to search with "prev" method
				suffix_next = 'n', -- Suffix to search with "next" method
			},
			search_method = 'cover_or_next',
		},
	},

	{
		'echasnovski/mini.pairs',
		event = 'InsertEnter',
		version = '*',
		config = function()
			require('mini.pairs').setup()
		end,
	},
}
