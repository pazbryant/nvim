local usercmd = vim.api.nvim_create_user_command

-- fix leap cursor issues hidding the (real) cursor when leaping,
-- and restore it afterwards.
usercmd('LeapEnter', function()
	vim.cmd.hi('Cursor', 'blend=100')
	vim.opt.guicursor:append({ 'a:Cursor/lCursor' })
end, {
	nargs = 0,
	desc = 'Append custom cursor style',
})

usercmd('LeapLeave', function()
	vim.cmd.hi('Cursor', 'blend=0')
	vim.opt.guicursor:remove({ 'a:Cursor/lCursor' })
end, {
	nargs = 0,
	desc = 'Toggles virtual text display for diagnostics.',
})

-- Function to sort lines by length
usercmd('Sort', function()
	local start_line = vim.fn.line("'<")
	local end_line = vim.fn.line("'>")
	local get_lines = vim.api.nvim_buf_get_lines

	local lines = get_lines(0, start_line - 1, end_line, false)

	local non_empty_lines = {}
	for _, line in ipairs(lines) do
		line = vim.trim(line)
		if line ~= '' then
			table.insert(non_empty_lines, line)
		end
	end

	table.sort(non_empty_lines, function(a, b)
		return #a < #b
	end)

	vim.api.nvim_buf_set_lines(0, start_line - 1, end_line, false, non_empty_lines)
end, {
	range = true,
	desc = 'Sort lines by length (shortest to longest)',
})
