local usercmd = vim.api.nvim_create_user_command

usercmd('TSpell', function()
	vim.cmd([[set spell!]])
end, { nargs = 0 })

usercmd('TRelativeNumber', function()
	vim.cmd([[set rnu!]])
end, { nargs = 0 })
