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

usercmd('Frappe', function()
	vim.cmd([[colorscheme catppuccin-frappe]])
end, { nargs = 0 })

usercmd('Rosepine', function()
	vim.cmd([[colorscheme rose-pine]])
end, { nargs = 0 })

usercmd('Solarized', function()
	vim.cmd([[colorscheme solarized]])
end, { nargs = 0 })

usercmd('Osaka', function()
	vim.cmd([[colorscheme solarized-osaka]])
end, { nargs = 0 })
