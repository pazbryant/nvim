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

usercmd('Catppuccinfrappe', function()
	vim.cmd([[colorscheme catppuccin-frappe]])
end, { nargs = 0 })

usercmd('Catppuccinlatte', function()
	vim.cmd([[colorscheme catppuccin-latte]])
end, { nargs = 0 })

usercmd('Rosepine', function()
	vim.cmd([[colorscheme rose-pine]])
end, { nargs = 0 })

usercmd('Rosepinedown', function()
	vim.cmd([[colorscheme rose-pine-dawn]])
end, { nargs = 0 })

usercmd('Githubdark', function()
	vim.cmd([[colorscheme github_dark]])
end, { nargs = 0 })

usercmd('Githublight', function()
	vim.cmd([[colorscheme github_light_colorblind]])
end, { nargs = 0 })
