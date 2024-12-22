return {
	'jake-stewart/multicursor.nvim',
	branch = '1.0',
	lazy = false,
	config = function()
		local mc = require('multicursor-nvim')

		mc.setup()

		local map = vim.keymap.set

		-- Add or skip adding a new cursor by matching word/selection
		map({ 'n', 'v' }, '<C-n>', function()
			mc.matchAddCursor(1)
		end)
		map({ 'n', 'v' }, '<M-s>', function()
			mc.matchSkipCursor(1)
		end)
		map({ 'n', 'v' }, '<leader>n', function()
			mc.matchAddCursor(-1)
		end)
		map({ 'n', 'v' }, '<leader>s', function()
			mc.matchSkipCursor(-1)
		end)

		-- Add and remove cursors with control + left click.
		map('n', '<c-leftmouse>', mc.handleMouse)

		map('n', '<esc>', function()
			if not mc.cursorsEnabled() then
				mc.enableCursors()
			elseif mc.hasCursors() then
				mc.clearCursors()
			else
				-- Default <esc> handler.
			end
		end)

		-- Append/insert for each line of visual selections.
		map('v', 'I', mc.insertVisual)
		map('v', 'A', mc.appendVisual)

		-- Customize how cursors look.
		local hl = vim.api.nvim_set_hl
		hl(0, 'MultiCursorCursor', { fg = '#ffffff', bg = '#76ccbc', bold = true })
		hl(0, 'MultiCursorVisual', { fg = '#000000', bg = '#76ccbc', bold = true })
		hl(0, 'MultiCursorSign', { fg = '#ffffff', bg = '#76ccbc' })
		hl(0, 'MultiCursorDisabledCursor', { fg = '#808080', bg = '#76ccbc' })
		hl(0, 'MultiCursorDisabledVisual', { fg = '#808080', bg = '#76ccbc' })
		hl(0, 'MultiCursorDisabledSign', { fg = '#808080', bg = '#76ccbc' })
	end,
}
