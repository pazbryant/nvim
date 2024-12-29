return {
	{
		'nvim-neotest/neotest',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'antoinemadec/FixCursorHold.nvim',
			'nvim-treesitter/nvim-treesitter',
			-- Language adapters
			'nvim-neotest/neotest-go',
			'nvim-neotest/neotest-python',
			'nvim-neotest/neotest-jest',
		},
		config = function()
			-- Get the neotest namespace (api call creates or returns namespace)
			local neotest_ns = vim.api.nvim_create_namespace('neotest')
			local neotest = require('neotest')

			-- Get status for treesitter
			local utils = require('neotest.lib.utils')

			-- Setup neotest
			neotest.setup({
				-- Your neotest configuration
				adapters = {
					require('neotest-python')({
						-- Python-specific settings
						dap = { justMyCode = false },
						runner = 'pytest',
						python = 'python3',
						is_test_file = function(file_path)
							return file_path:match('test_.*%.py$') or file_path:match('.*_test%.py$')
						end,
					}),
					require('neotest-go')({
						-- Go-specific settings
						args = { '-count=1', '-timeout=60s' },
						experimental = {
							test_table = true,
						},
					}),
					require('neotest-jest')({
						-- Jest-specific settings
						jestCommand = 'npm test --',
						jestConfigFile = 'jest.config.ts',
						env = { CI = true },
						cwd = function(path)
							return vim.fn.getcwd()
						end,
					}),
				},
				-- Global settings
				discovery = {
					enabled = true,
				},
				diagnostic = {
					enabled = true,
				},
				floating = {
					border = 'rounded',
					max_height = 0.6,
					max_width = 0.6,
					options = {},
				},
				highlights = {
					adapter_name = 'NeotestAdapterName',
					border = 'NeotestBorder',
					dir = 'NeotestDir',
					failed = 'NeotestFailed',
					file = 'NeotestFile',
					focused = 'NeotestFocused',
					indent = 'NeotestIndent',
					marked = 'NeotestMarked',
					namespace = 'NeotestNamespace',
					passed = 'NeotestPassed',
					running = 'NeotestRunning',
					select_win = 'NeotestWinSelect',
					skipped = 'NeotestSkipped',
					target = 'NeotestTarget',
					test = 'NeotestTest',
					unknown = 'NeotestUnknown',
				},
				icons = {
					child_indent = '│',
					child_prefix = '├',
					collapsed = '─',
					expanded = '╮',
					failed = '✖',
					final_child_indent = ' ',
					final_child_prefix = '╰',
					non_collapsible = '─',
					passed = '✔',
					running = '↻',
					skipped = 'ﰸ',
					unknown = '?',
				},
				output = {
					enabled = true,
					open_on_run = true,
				},
				run = {
					enabled = true,
				},
				status = {
					enabled = true,
					signs = true,
					virtual_text = false,
				},
				strategies = {
					integrated = {
						height = 40,
						width = 120,
					},
				},
				summary = {
					enabled = true,
					expand_errors = true,
					follow = true,
					mappings = {
						attach = 'a',
						clear_marked = 'M',
						clear_target = 'T',
						debug = 'd',
						debug_marked = 'D',
						expand = { '<CR>', '<2-LeftMouse>' },
						expand_all = 'e',
						jumpto = 'i',
						mark = 'm',
						next_failed = 'J',
						output = 'o',
						prev_failed = 'K',
						run = 'r',
						run_marked = 'R',
						short = 'O',
						stop = 'u',
					},
				},
			})

			-- Set up keymaps using LazyVim's keys format
			return {
				keys = {
					{
						'<leader>tr',
						function()
							neotest.run.run(vim.fn.expand('%'))
						end,
						desc = 'Run File',
					},
					{
						'<leader>tR',
						function()
							neotest.run.run(vim.loop.cwd())
						end,
						desc = 'Run All Test Files',
					},
					{
						'<leader>tn',
						function()
							neotest.run.run()
						end,
						desc = 'Run Nearest',
					},
					{
						'<leader>ts',
						function()
							neotest.summary.toggle()
						end,
						desc = 'Toggle Summary',
					},
					{
						'<leader>to',
						function()
							neotest.output.open({ enter = true, auto_close = true })
						end,
						desc = 'Show Output',
					},
					{
						'<leader>tO',
						function()
							neotest.output_panel.toggle()
						end,
						desc = 'Toggle Output Panel',
					},
					{
						'<leader>tS',
						function()
							neotest.run.stop()
						end,
						desc = 'Stop',
					},
					{
						'<leader>td',
						function()
							neotest.run.run({ strategy = 'dap' })
						end,
						desc = 'Debug Nearest',
					},
				},
			}
		end,
	},
}
