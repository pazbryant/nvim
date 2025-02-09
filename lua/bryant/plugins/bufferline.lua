return {
	'akinsho/bufferline.nvim',
	version = '*',
	enabled = true,
	lazy = false,
	dependencies = 'nvim-tree/nvim-web-devicons',
	config = function()
		require('bufferline').setup({
			options = {
				custom_filter = function(buf_number)
					-- Show only the current buffer
					local current_buffer = vim.api.nvim_get_current_buf()
					return buf_number == current_buffer
				end,
				color_icons = false, -- whether or not to add the filetype icon highlights
				show_buffer_icons = false, -- disable filetype icons for buffers
				show_buffer_close_icons = false,
			},
		})
	end,
}
