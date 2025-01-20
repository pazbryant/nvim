return {
	'mfussenegger/nvim-dap',
	dependencies = {
		{ 'rcarriga/nvim-dap-ui', opts = {} },
		{ 'theHamsta/nvim-dap-virtual-text', opts = {} },
		'nvim-neotest/nvim-nio',
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
	end,
	keys = {
		-- stylua: ignore start
		{ '<leader>gdc', function() require('dap').continue() end, desc = 'Start/Continue Debug' },
		{ '<leader>gdb', function() require('dap').toggle_breakpoint() end, desc = 'Toggle Breakpoint' },
		{ '<leader>gdo', function() require('dap').step_over() end, desc = 'Step Over' },
		{ '<leader>gdi', function() require('dap').step_into() end, desc = 'Step Into' },
		{ '<leader>gdO', function() require('dap').step_out() end, desc = 'Step Out' },
		{ '<leader>gdt', function() require('dapui').toggle() end, desc = 'Toggle Debug UI' },
	},
}
