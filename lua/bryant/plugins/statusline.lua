return {
	'echasnovski/mini.statusline',
	lazy = false,
	version = '*',
	opts = {
		-- Whether to use icons by default
		use_icons = true,

		-- Whether to set Vim's settings for statusline (make it always shown)
		set_vim_settings = true,
	},
	config = function(_, opts)
		require('mini.statusline').setup(opts)
	end,
}
