return {
	'akinsho/bufferline.nvim',
	version = '*',
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
			},
		})
	end,
}
