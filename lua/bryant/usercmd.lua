local usercmd = vim.api.nvim_create_user_command

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

usercmd('CmpToggle', function()
	local cmp = require('cmp')
	local current_setting = cmp.get_config().completion.autocomplete
	if current_setting and #current_setting > 0 then
		cmp.setup({ completion = { autocomplete = false } })
		vim.notify('Cmp has ben disabled', vim.log.levels.INFO)
	else
		cmp.setup({
			completion = { autocomplete = { cmp.TriggerEvent.TextChanged } },
		})
		vim.notify('Cmp has ben enabled', vim.log.levels.INFO)
	end
end, {
	desc = 'Toggle cpm',
})

usercmd('SpellToggle', function()
	vim.cmd([[set spell!]])
	local is_spell_on = vim.opt.spell:get() and 'on' or 'off'
	vim.notify(string.format('spell is %s', is_spell_on), vim.log.levels.INFO)
end, { desc = 'Spell toggle' })
