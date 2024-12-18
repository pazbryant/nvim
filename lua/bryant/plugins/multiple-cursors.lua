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
		map({ 'n', 'v' }, '<C-s>', function()
			mc.matchSkipCursor(1)
		end)
		map({ 'n', 'v' }, '<leader>n', function()
			mc.matchAddCursor(-1)
		end)
		map({ 'n', 'v' }, '<leader>s', function()
			mc.matchSkipCursor(-1)
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

		-- Clone every cursor and disable the originals.
		map({ 'n', 'v' }, '<leader><c-q>', mc.duplicateCursors)

		map('n', '<esc>', function()
			if not mc.cursorsEnabled() then
				mc.enableCursors()
			elseif mc.hasCursors() then
				mc.clearCursors()
			else
				-- Default <esc> handler.
			end
		end)

		-- bring back cursors if you accidentally clear them
		map('n', '<leader>gv', mc.restoreCursors)

		-- Align cursor columns.
		map('n', '<leader>a', mc.alignCursors)

		-- Append/insert for each line of visual selections.
		map('v', 'I', mc.insertVisual)
		map('v', 'A', mc.appendVisual)

		-- match new cursors within visual selections by regex.
		map('v', 'M', mc.matchCursors)

		-- Rotate visual selection contents.
		map('v', '<leader>t', function()
			mc.transposeCursors(1)
		end)
		map('v', '<leader>T', function()
			mc.transposeCursors(-1)
		end)

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
