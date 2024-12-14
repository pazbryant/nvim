return {
	{
		'neovim/nvim-lspconfig',
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = {
			'williamboman/mason.nvim',
			{
				'williamboman/mason-lspconfig.nvim',
				opts = {
					ensure_installed = {
						'cssls',
						'pyright',
						'clangd',
						'marksman',
						'html',
						'bashls',
						'ts_ls',
						'emmet_language_server',
						'gopls',
						'lua_ls',
					},
				},
				config = function(_, opts)
					require('mason-lspconfig').setup(opts)
					require('bryant.plugins.lsp.setup')
				end,
			},
		},
	},

	{
		'williamboman/mason.nvim',
		dependencies = 'WhoIsSethDaniel/mason-tool-installer.nvim',
		branch = 'main',
		cmd = 'Mason',
		config = function()
			local ensure_installed = {
				-- lua
				'stylua',
				'luacheck',

				-- web dev
				'prettierd',
				'prettier',

				-- bash
				'shfmt',
				'shellcheck',

				-- c
				'clang-format',

				-- golang
				'gofumpt',
				'goimports',
				'golangci-lint',

				-- python
				'black',
				'ruff',
				'isort',

				-- markdown
				'alex',
				'markdownlint',

				-- javascript
				'eslint_d',
			}
			require('mason').setup({
				ui = {
					border = 'single',
				},
			})
			require('mason-tool-installer').setup({
				ensure_installed = ensure_installed,
			})
		end,
	},

	{
		'stevearc/conform.nvim',
		event = { 'BufWritePre' },
		cmd = { 'ConformInfo' },
		keys = {
			{
				'<leader>um',
				function()
					require('conform').format({ lsp_fallback = true })
				end,
				desc = 'Format document with conform',
			},
		},
		init = function()
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
		opts = {
			formatters_by_ft = {
				lua = { 'stylua' },
				javascript = { 'prettierd' },
				javascriptreact = { 'prettierd' },
				typescript = { 'prettierd' },
				typescriptreact = { 'prettierd' },
				css = { 'prettierd' },
				html = { 'prettierd' },
				json = { 'prettierd' },
				jsonc = { 'prettierd' },
				scss = { 'prettier' },
				less = { 'prettier' },
				yaml = { 'prettier' },
				markdown = { 'markdownlint' },
				sh = { 'shfmt' },
				c = { 'clang-format' },
				go = { 'gofumpt', 'goimports' },
				python = { 'black', 'isort' },
				['markdown.mdx'] = { 'markdownlint' },
			},
			format_on_save = function(bufnr)
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				return { timeout_ms = 500, lsp_fallback = true }
			end,
		},
		config = function(_, opts)
			vim.api.nvim_create_user_command('FormatDisable', function(args)
				-- `FormatDisable!` will disable formatting just for this buffer
				if args.bang then
					vim.b.disable_autoformat = true
				else
					vim.g.disable_autoformat = true
				end
			end, {
				desc = 'Disable autoformat-on-save',
				bang = true,
			})
			vim.api.nvim_create_user_command('FormatEnable', function()
				vim.b.disable_autoformat = false
				vim.g.disable_autoformat = false
			end, {
				desc = 'Re-enable autoformat-on-save',
			})
			require('conform').setup(opts)
		end,
	},

	{
		'mfussenegger/nvim-lint',
		lazy = false,
		enabled = true,
		config = function()
			local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
			local lint = require('lint')
			local enabled = false
			local autocmd_id = nil

			local function enable_linter()
				if enabled then
					return
				end
				autocmd_id = vim.api.nvim_create_autocmd(
					{ 'BufEnter', 'BufWritePost', 'InsertLeave' },
					{
						group = lint_augroup,
						callback = function()
							require('lint').try_lint()
						end,
					}
				)
				enabled = true
			end

			local function disable_linter()
				if not enabled then
					return
				end
				if autocmd_id then
					vim.api.nvim_del_autocmd(autocmd_id)
					autocmd_id = nil
				end
				vim.diagnostic.reset()
				enabled = false
			end

			local function toggle_linter()
				if enabled then
					disable_linter()
				else
					enable_linter()
				end
			end

			vim.api.nvim_create_user_command('ToggleLinter', function()
				toggle_linter()
			end, { nargs = 0 })

			lint.linters_by_ft = {
				sh = { 'shellcheck' },
				bash = { 'shellcheck' },
				lua = { 'luacheck' },
				c = { 'clangtidy' },
				go = { 'golangcilint' },
				python = { 'ruff' },
				markdown = { 'alex', 'markdownlint' },
				javascript = { 'eslint_d' },
				typescript = { 'eslint_d' },
				typescriptreact = { 'eslint_d' },
				javascriptreact = { 'eslint_d' },
			}
		end,
	},
}
