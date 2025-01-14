return {
	'MagicDuck/grug-far.nvim',
	cmd = 'GrugFar',
	opts = {},
	keys = {
		{
			'<leader>R',
			function()
				require('grug-far').toggle_instance({
					instanceName = 'far',
					staticTitle = 'Find and Replace',
				})
			end,
			desc = 'GrugFar replace',
		},
	},
}
