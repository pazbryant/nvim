return {
	'kevinhwang91/nvim-bqf',
	ft = 'qf',
	dependencies = {
		'junegunn/fzf',
		build = function()
			vim.fn['fzf#install']()
		end,
	},
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
}
