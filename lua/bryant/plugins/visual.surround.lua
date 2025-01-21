return {
	'NStefan002/visual-surround.nvim',
	event = 'BufEnter',
	config = function()
		require('visual-surround').setup({
			use_default_keymaps = true,
			exit_visual_mode = true,
		})
	end,
}
