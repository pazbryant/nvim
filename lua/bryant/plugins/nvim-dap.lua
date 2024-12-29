return {
	{
		'mfussenegger/nvim-dap',
		dependencies = {
			'rcarriga/nvim-dap-ui',
			'theHamsta/nvim-dap-virtual-text',

			'mfussenegger/nvim-dap-python', -- Python adapter
			'leoluz/nvim-dap-go', -- Go adapter
			'mxsdev/nvim-dap-vscode-js', -- JavaScript/TypeScript adapter
		},
		keys = {
			{
				'<leader>ds',
				function()
					require('dap').continue()
				end,
				desc = 'Start/Continue Debug',
			},
			{
				'<leader>db',
				function()
					require('dap').toggle_breakpoint()
				end,
				desc = 'Toggle Breakpoint',
			},
			{
				'<leader>do',
				function()
					require('dap').step_over()
				end,
				desc = 'Step Over',
			},
			{
				'<leader>di',
				function()
					require('dap').step_into()
				end,
				desc = 'Step Into',
			},
			{
				'<leader>dO',
				function()
					require('dap').step_out()
				end,
				desc = 'Step Out',
			},
			{
				'<leader>dt',
				function()
					require('dapui').toggle()
				end,
				desc = 'Toggle UI',
			},
		},
		config = function()
			local dap = require('dap')
			local dapui = require('dapui')

			-- UI Configuration
			require('nvim-dap-virtual-text').setup({
				enabled = true,
				enabled_commands = true,
				highlight_changed_variables = true,
				highlight_new_as_changed = false,
			})

			dapui.setup({
				icons = { expanded = '▾', collapsed = '▸', current_frame = '▸' },
				mappings = {
					expand = { '<CR>', '<2-LeftMouse>' },
					open = 'o',
					remove = 'd',
					edit = 'e',
					repl = 'r',
					toggle = 't',
				},
			})

			-- Automatically open/close UI
			dap.listeners.after.event_initialized['dapui_config'] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated['dapui_config'] = function()
				dapui.close()
			end

			-- Python Configuration
			require('dap-python').setup('python') -- Uses debugpy by default

			-- Go Configuration
			require('dap-go').setup()

			-- JavaScript/TypeScript Configuration
			require('dap-vscode-js').setup({
				debugger_path = vim.fn.stdpath('data') .. '/lazy/vscode-js-debug', -- Adjust path as needed
				adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
			})

			-- Configure JavaScript/TypeScript debugger
			for _, language in ipairs({ 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' }) do
				dap.configurations[language] = {
					{
						type = 'pwa-node',
						request = 'launch',
						name = 'Launch file',
						program = '${file}',
						cwd = '${workspaceFolder}',
					},
					{
						type = 'pwa-node',
						request = 'attach',
						name = 'Attach',
						processId = require('dap.utils').pick_process,
						cwd = '${workspaceFolder}',
					},
					{
						type = 'pwa-chrome',
						request = 'launch',
						name = 'Launch Chrome',
						url = 'http://localhost:3000',
						webRoot = '${workspaceFolder}',
					},
				}
			end
		end,
	},
}
