local usercmd = vim.api.nvim_create_user_command

usercmd('ToggleSpell', function()
	vim.cmd([[set spell!]])
end, {
	nargs = 0,
	desc = 'Toggles spell checking in the current buffer.',
})

usercmd('ToggleRelativeNumber', function()
	vim.cmd([[set rnu!]])
end, {
	nargs = 0,
	desc = 'Toggles relative line numbers in the current buffer.',
})

usercmd('ToggleDiagnostics', function()
	local current_value = vim.diagnostic.is_disabled()
	if current_value then
		vim.diagnostic.enable()
	else
		vim.diagnostic.disable()
	end
end, {
	nargs = 0,
	desc = 'Toggles diagnostics (enable/disable).',
})

local enabled = true
usercmd('ToggleVirtualText', function()
	if enabled then
		vim.diagnostic.config({ virtual_text = false })
	else
		vim.diagnostic.config({ virtual_text = true })
	end
	enabled = not enabled
end, {
	nargs = 0,
	desc = 'Toggles virtual text display for diagnostics.',
})
