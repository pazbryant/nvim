return {
	'kevinhwang91/nvim-bqf',
	ft = 'qf',
	opts = {
		preview = {
			winblend = 0, -- Set this to match your default transparency (0-100)
		},
	},
	config = function(_, opts)
		require('bqf').setup(opts)
	end,
}
