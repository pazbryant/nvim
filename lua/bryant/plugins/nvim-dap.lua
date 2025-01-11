return {
	'mfussenegger/nvim-dap',
	dependencies = {
		{
			'rcarriga/nvim-dap-ui',
			opts = {}, -- Configuration for dap-ui
		},
		{
			'theHamsta/nvim-dap-virtual-text',
			opts = {}, -- Configuration for virtual text
		},
		'nvim-neotest/nvim-nio', -- needed for dapui
		-- Lua adapter for debugging
	},
	config = function()
		local dap = require('dap')
		local dapui = require('dapui')

		-- Automatically open/close dap-ui
		dap.listeners.after.event_initialized['dapui_config'] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated['dapui_config'] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited['dapui_config'] = function()
			dapui.close()
		end

		-- Configure debugging for Lua
		dap.adapters.nlua = function(callback, config)
			callback({ type = 'server', host = config.host or '127.0.0.1', port = config.port or 8086 })
		end
		dap.configurations.lua = {
			{
				type = 'nlua',
				request = 'attach',
				name = 'Attach to running Neovim instance',
			},
		}
	end,
	keys = {
		-- stylua: ignore start
		{ '<leader>dc', function() require('dap').continue() end, desc = 'Start/Continue Debug' },
		{ '<leader>db', function() require('dap').toggle_breakpoint() end, desc = 'Toggle Breakpoint' },
		{ '<leader>do', function() require('dap').step_over() end, desc = 'Step Over' },
		{ '<leader>di', function() require('dap').step_into() end, desc = 'Step Into' },
		{ '<leader>dO', function() require('dap').step_out() end, desc = 'Step Out' },
		{ '<leader>dt', function() require('dapui').toggle() end, desc = 'Toggle Debug UI' },
		-- stylua: ignore end
	},
}
