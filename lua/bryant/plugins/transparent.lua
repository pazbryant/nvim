return {
	'xiyaowong/transparent.nvim',
	cmd = { 'TransparentEnable', 'TransparentDisable' },
	opts = {
		groups = {
			'Normal',
			'NormalNC',
			'Comment',
			'Constant',
			'Special',
			'Identifier',
			'Statement',
			'PreProc',
			'Type',
			'Underlined',
			'Todo',
			'String',
			'Function',
			'Conditional',
			'Repeat',
			'Operator',
			'Structure',
			'LineNr',
			'NonText',
			'SignColumn',
			'CursorLine',
			'CursorLineNr',
			'StatusLine',
			'StatusLineNC',
			'EndOfBuffer',
		},
		-- table: additional groups that should be cleared
		extra_groups = {
			'NormalFloat',
			'NvimTreeNormal',
		},
		-- table: groups you don't want to clear
		exclude_groups = {},
		-- function: code to be executed after highlight groups are cleared
		-- Also the user event "TransparentClear" will be triggered
		on_clear = function() end,
	},
	keys = function()
		local transparent_enabled = false
		local usercmd = vim.api.nvim_create_user_command

		usercmd('CTransparentToggle', function()
			vim.cmd.colorscheme('kanagawa')
			if transparent_enabled then
				vim.cmd([[TransparentDisable]])
			else
				vim.cmd([[TransparentEnable]])
			end
			transparent_enabled = not transparent_enabled
		end, { desc = 'Toggle Transparent' })

    -- stylua: ignore start
		return {
      { '<leader>tt', '<cmd>CTransparentToggle<cr>', desc = 'Transparent toggle' }
    }
	end,
}
