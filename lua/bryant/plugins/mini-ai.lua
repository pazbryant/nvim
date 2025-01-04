return {
	'echasnovski/mini.ai',
	lazy = false,
	version = '*',
	opts = {
		custom_textobjects = nil,

		-- Module mappings. Use `''` (empty string) to disable one.
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

		-- Number of lines within which textobject is searched
		n_lines = 50,

		-- How to search for object (first inside current line, then inside
		-- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
		-- 'cover_or_nearest', 'next', 'previous', 'nearest'.
		search_method = 'cover_or_next',

		-- Whether to disable showing non-error feedback
		-- This also affects (purely informational) helper messages shown after
		-- idle time if user input is required.
		silent = false,
	},
}

-- NOTE: Defaults keybinds

-- q = '' "" ``
-- b = [] {} ()
-- af = outer function
-- if = inner function
-- a = argument
-- n = next
-- e = earlier
-- *number = count from actual position
-- g] = next text object
-- g[ = previous text object
