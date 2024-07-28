local usercmd = vim.api.nvim_create_user_command

usercmd('Spelltoggle', function()
	vim.cmd([[set spell!]])
end, { nargs = 0 })

usercmd('Relativenumbertoggle', function()
	vim.cmd([[set rnu!]])
end, { nargs = 0 })

usercmd('Diagnostictoggle', function()
	local current_value = vim.diagnostic.is_disabled()
	if current_value then
		vim.diagnostic.enable()
	else
		vim.diagnostic.disable()
	end
end, { nargs = 0 })

local enabled = true
usercmd('Virtulatexttoggle', function()
	if enabled then
		vim.diagnostic.config({ virtual_text = false })
	else
		vim.diagnostic.config({ virtual_text = true })
	end
	enabled = not enabled
end, { nargs = 0 })
