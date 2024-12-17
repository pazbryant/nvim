return {
	'NvChad/nvim-colorizer.lua',
	event = 'BufReadPre',
	config = function()
		require('colorizer').setup({
			filetypes = {
				'*',
				'!vim',
				'!lua',
				html = { mode = 'background' },
				css = { mode = 'background' },
			},
			user_default_options = { mode = 'foreground' },
		})
	end,
}
