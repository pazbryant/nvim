return {
	'glacambre/firenvim',
	build = ':call firenvim#install(0)',
	init = function()
		vim.g.firenvim_config = {
			localSettings = {
				['.*'] = {
					takeover = 'never',
					cmdline = 'firenvim', -- none / neovim
				},
			},
			globalSettings = {
				ignoreKeys = {
					all = { '<C-t>', '<C-w>', '<C-e>' },
					normal = {},
				},
			},
		}
	end,
	lazy = false,
}
