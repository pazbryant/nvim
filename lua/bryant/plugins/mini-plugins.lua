local M = {
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
			{ 'ga', desc = 'Align text' },
			{ 'gA', desc = 'Align text with preview' },
		},
		opts = {},
	},

	{
		'echasnovski/mini.surround',
		version = '*',
		keys = {
			-- Here's a different mapping to avoid conflict with flash.nvim
			{ 'gza', desc = 'Add surrounding', mode = { 'n', 'v' } },
			{ 'gzd', desc = 'Delete surrounding' },
			{ 'gzr', desc = 'Replace surrounding' },
			{ 'gzf', desc = 'Find surrounding' },
			{ 'gzF', desc = 'Find surrounding backward' },
			{ 'gzh', desc = 'Highlight surrounding' },
			{ 'gzn', desc = 'Update n_lines' },
		},
		opts = {
			-- Custom mappings to avoid 's' conflict
			mappings = {
				add = 'gza', -- Add surrounding in Normal and Visual modes
				delete = 'gzd', -- Delete surrounding
				find = 'gzf', -- Find surrounding (to the right)
				find_left = 'gzF', -- Find surrounding (to the left)
				highlight = 'gzh', -- Highlight surrounding
				replace = 'gzr', -- Replace surrounding
				update_n_lines = 'gzn', -- Update `n_lines`
			},
		},
	},

	{
		'echasnovski/mini.operators',
		version = '*',
		keys = {
			{ 'g=', desc = 'Evaluate text' },
			{ 'gx', desc = 'Exchange text' },
			{ 'gm', desc = 'Multiply text' },
			{ 'gr', desc = 'Replace text' },
			{ 'gs', desc = 'Sort text' },
		},
		opts = {},
	},
}

return M
