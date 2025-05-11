return {
	'echasnovski/mini.surround',
	version = '*',
	keys = {
		-- Here's a different mapping to avoid conflict with flash.nvim
		{ 'sa', desc = 'Mini.surround Add Surrounding', mode = { 'n', 'v' } },
		{ 'sd', desc = 'Mini.surround Delete Surrounding' },
		{ 'sf', desc = 'Mini.surround Find Surrounding' },
		{ 'sF', desc = 'Mini.surround Find Surrounding backward' },
		{ 'sh', desc = 'Mini.surround Highlight Surrounding' },
		{ 'sr', desc = 'Mwnw.surround Replace Surrounding' },
		{ 'sn', desc = 'Mini.surround Update N Lines' },
		{ 'S', desc = 'Mini.surround Surround Full Line' },
	},
	config = function()
		require('mini.surround').setup({
			custom_surroundings = nil,
			highlight_duration = 500,

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

			n_lines = 20,

			respect_selection_type = false,

			search_method = 'cover_or_next',

			silent = false,
		})
		-- stylua: ignore start
		vim.keymap.set('n', 'S', 'sa_', { desc="Surround Full Line", remap = true })
	end,
}
