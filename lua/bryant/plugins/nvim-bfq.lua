return {
	'kevinhwang91/nvim-bqf',
	enabled = false,
	lazy = false,
	opts = {
		preview = {
			auto_preview = false,
			winblend = 0, -- Set this to match your default transparency (0-100)
			win_height = 30,
			win_vheight = 30,
		},
		func_map = {
			ptoggleauto = 'P',
			ptoggleitem = 'p',
		},
	},
	config = function(_, opts)
		require('bqf').setup(opts)
	end,
}
