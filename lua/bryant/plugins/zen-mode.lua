return {
	'folke/zen-mode.nvim',
	opts = {
		window = {
			backdrop = 1,
			width = 80,
			options = {
				signcolumn = 'no', -- disable signcolumn
				number = false, -- disable number column
				relativenumber = false, -- disable relative numbers
				cursorline = false, -- disable cursorline
				cursorcolumn = false, -- disable cursor column
				foldcolumn = '0', -- disable fold column
				list = false, -- disable whitespace characters
			},
		},
		plugins = {
			options = {
				enabled = true,
				ruler = false,
				showcmd = false,
				laststatus = 0,
			},
			tmux = {
				enabled = true,
			},
			todo = {
				enabled = true,
			},
		},
	},
	keys = {
		{
			'zm',
			function()
				require('zen-mode').toggle()
			end,
			desc = 'Toggle zen mode',
		},
	},
}
