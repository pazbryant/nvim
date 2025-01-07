return {
	'echasnovski/mini.ai',
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
				around_last = 'ae',
				inside_last = 'ie',

				-- Move cursor to corresponding edge of `a` textobject
				goto_left = 'g[',
				goto_right = 'g]',
			},
			custom_textobjects = {
				-- Disable brackets alias in favor of builtin block textobject
				b = false,

				o = ai.gen_spec.treesitter({
					a = { '@block.outer', '@conditional.outer', '@loop.outer' },
					i = { '@block.inner', '@conditional.inner', '@loop.inner' },
				}, {}),
				F = ai.gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }, {}),
				c = ai.gen_spec.treesitter({ a = '@class.outer', i = '@class.inner' }, {}),
			},
		}
	end,
}

-- NOTE: Defaults keybinds

-- q = '' "" ``
-- o = {[( if loop class )]}
-- af = outer function
-- if = inner function
-- a = argument
-- n = next
-- e = earlier
-- *number = count from actual position
-- g] = next text object
-- g[ = previous text object


--- NOTE: Example

-- dio - delete inside block/conditional/loop
-- dao - delete around block/conditional/loop
-- yio - yank (copy) inside block/conditional/loop
-- yao - yank (copy) around block/conditional/loop
-- cio - change inside block/conditional/loop
-- cao - change around block/conditional/loop
-- vio - visually select inside block/conditional/loop
-- vao - visually select around block/conditional/loop
