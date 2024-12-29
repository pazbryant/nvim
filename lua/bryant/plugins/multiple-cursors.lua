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
		map({ 'n', 'v' }, '<C-S>n', function()
			mc.matchSkipCursor(1)
		end)

		-- Add or skip cursor above/below the main cursor.
		map({ 'n', 'v' }, '<up>', function()
			mc.lineAddCursor(-1)
		end)
		map({ 'n', 'v' }, '<down>', function()
			mc.lineAddCursor(1)
		end)
		map({ 'n', 'v' }, '<leader><up>', function()
			mc.lineSkipCursor(-1)
		end)
		map({ 'n', 'v' }, '<leader><down>', function()
			mc.lineSkipCursor(1)
		end)

		-- Add all matches in the document
		map({ 'n', 'v' }, '<leader>A', mc.matchAllAddCursors)

		-- Rotate the main cursor.
		map({ 'n', 'v' }, '<left>', mc.nextCursor)
		map({ 'n', 'v' }, '<right>', mc.prevCursor)

		-- Delete the main cursor.
		map({ 'n', 'v' }, '<C-x>', mc.deleteCursor)

		-- Add and remove cursors with control + left click.
		map('n', '<c-leftmouse>', mc.handleMouse)

		-- Easy way to add and remove cursors using the main cursor.
		map({ 'n', 'v' }, '<c-q>', mc.toggleCursor)

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

		-- Rotate visual selection contents.
		map('v', '<leader>t', function()
			mc.transposeCursors(1)
		end)
		map('v', '<leader>T', function()
			mc.transposeCursors(-1)
		end)

		-- Customize how cursors look.
		local hl = vim.api.nvim_set_hl
		hl(0, 'MultiCursorCursor', { link = 'Cursor' })
		hl(0, 'MultiCursorVisual', { link = 'Visual' })
		hl(0, 'MultiCursorSign', { link = 'SignColumn' })
		hl(0, 'MultiCursorDisabledCursor', { link = 'Visual' })
		hl(0, 'MultiCursorDisabledVisual', { link = 'Visual' })
		hl(0, 'MultiCursorDisabledSign', { link = 'SignColumn' })
	end,
}
