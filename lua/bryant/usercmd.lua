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
