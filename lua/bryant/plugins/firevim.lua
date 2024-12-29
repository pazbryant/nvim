return {
	{
		'glacambre/firenvim',
		-- Load firenvim only when needed
		lazy = not vim.g.started_by_firenvim,
		build = ':call firenvim#install(0)',
		config = function()
			-- Disable automatic content write
			vim.g.firenvim_config = {
				globalSettings = {
					-- Disable automatic triggering
					alt = 'all',
					-- Only trigger when using the keyboard shortcut
					['<C-e>'] = 'firenvim',
				},
				localSettings = {
					['.*'] = {
						content = 'text', -- Default content type
						priority = 0,
						selector = 'textarea, div[role="textbox"]',
						takeover = 'never', -- Never automatically take over
					},
					-- Special settings for specific sites if needed
					['https?://github\\.com/'] = {
						priority = 1,
						takeover = 'never',
						selector = 'textarea:not(.js-suggested-changes-template)', -- Specific selector for GitHub
					},
				},
			}

			-- Set up autocommands for FireVim instances
			vim.api.nvim_create_autocmd({ 'UIEnter' }, {
				callback = function()
					-- Only execute in FireVim instances
					if vim.g.started_by_firenvim then
						-- Increase the width of the FireVim instance
						vim.g.firenvim_config.localSettings['.*'].maximized = true

						-- Set a wider default size
						vim.o.lines = 40
						vim.o.columns = 60
						vim.o.laststatus = 0
						vim.o.cmdheight = 1

						-- Set a clean UI
						vim.opt.number = false
						vim.opt.relativenumber = false

						-- Set a lighter colorscheme for better web integration
						vim.cmd([[colorscheme default]])

						-- Enable word wrap for better text editing
						vim.opt.wrap = true
						vim.opt.linebreak = true
						vim.opt.breakindent = true

						-- Set smaller font size for better fit
						vim.g.gui_font_size = 10
						vim.opt.guifont = string.format('Maple Mono Normal:h%s', vim.g.gui_font_size)
					end
				end,
			})
		end,
	},
}
