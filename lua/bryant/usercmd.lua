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
