return {
	'folke/zen-mode.nvim',
	cmd = 'ZenMode',
	opts = {
		window = {
			backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
			-- height and width can be:
			-- * an absolute number of cells when > 1
			-- * a percentage of the width / height of the editor when <= 1
			-- * a function that returns the width or the height
			width = 150, -- width of the Zen window
			height = 1, -- height of the Zen window
			-- by default, no options are changed for the Zen window
			-- uncomment any of the options below, or add other vim.wo options you want to apply
			options = {
				-- signcolumn = "no", -- disable signcolumn
				-- number = false, -- disable number column
				-- relativenumber = false, -- disable relative numbers
				-- cursorline = false, -- disable cursorline
				-- cursorcolumn = false, -- disable cursor column
				-- foldcolumn = "0", -- disable fold column
				-- list = false, -- disable whitespace characters
			},
		},
		plugins = {
			options = {
				enabled = true,
				ruler = false, -- disables the ruler text in the cmd line area
				showcmd = false, -- disables the command in the last line of the screen
				-- you may turn on/off statusline in zen mode by setting 'laststatus'
				-- statusline will be shown only if 'laststatus' == 3
				laststatus = 0, -- turn off the statusline in zen mode
			},
			gitsigns = { enabled = false }, -- disables git signs
			tmux = { enabled = true }, -- disables the tmux statusline
			todo = { enabled = false }, -- if set to "true", todo-comments.nvim highlights will be disabled
			-- See alse also the Plugins/Wezterm section in this projects README
			neovide = {
				enabled = false,
				-- Will multiply the current scale factor by this number
				scale = 1.2,
				-- disable the Neovide animations while in Zen mode
				disable_animations = {
					neovide_animation_length = 0,
					neovide_cursor_animate_command_line = false,
					neovide_scroll_animation_length = 0,
					neovide_position_animation_length = 0,
					neovide_cursor_animation_length = 0,
					neovide_cursor_vfx_mode = '',
				},
			},
		},
	},
	keys = {
		{
			'zm',
			'<cmd>ZenMode<cr>',
			desc = 'Toggle Zen Mode',
		},
	},
}
