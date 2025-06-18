return {
	-- autor recomended not lazy load
	'windwp/nvim-ts-autotag',
	enabled = false,
	event = 'BufReadPre',
	config = function()
		require('nvim-ts-autotag').setup({
			opts = {
				enable_rename = true,
				enable_close = true,
				enable_close_on_slash = false,
			},
		})
	end,
}
