return {
	{
		'folke/lazydev.nvim',
		ft = 'lua',
		opts = {
			library = {
				{ path = 'luvit-meta/library', words = { 'vim%.uv' } },
			},
		},
	},
	{ 'Bilal2453/luvit-meta', lazy = true },
	{
		'neovim/nvim-lspconfig',
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = {
			'williamboman/mason.nvim',
			{
				'j-hui/fidget.nvim',
				opts = {
					notification = {
						window = {
							winblend = 0, -- Background color opacity in the notification window
						},
					},
					integration = {
						['nvim-tree'] = {
							enable = true, -- Integrate with nvim-tree/nvim-tree.lua (if installed)
						},
					},
				},
			},
			{
				'williamboman/mason-lspconfig.nvim',
				opts = {
					ensure_installed = {
						'cssls',
						'pyright',
						'clangd',
						'marksman',
						'html',
						'ts_ls',
						'emmet_language_server',
						'gopls',
						'lua_ls',
						'bashls',
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
				'shellharden',

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
		init = function()
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
		keys = {
			{
				'<leader>um',
				function()
					require('conform').format({ lsp_format = 'fallback' })
				end,
				desc = '[F]ormat buffer',
			},
		},
		opts = {
			notify_on_error = false,
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
				bash = { 'shfmt' },
				zsh = { 'shfmt' },
				c = { 'clang-format' },
				go = { 'gofumpt', 'goimports' },
				python = { 'black', 'isort' },
				['markdown.mdx'] = { 'markdownlint' },
			},
		},
		config = function(_, opts)
			require('conform').setup(opts)
		end,
	},
	{
		'mfussenegger/nvim-lint',
		event = { 'BufReadPre', 'BufNewFile' },
		config = function()
			local lint = require('lint')
			lint.linters_by_ft = {
				sh = { 'shellcheck' },
				bash = { 'shellcheck' },
				zsh = { 'shellcheck' },
				lua = { 'luacheck' },
				go = { 'golangcilint' },
				python = { 'ruff' },
				markdown = { 'alex', 'markdownlint' },
				javascript = { 'eslint_d' },
				typescript = { 'eslint_d' },
				typescriptreact = { 'eslint_d' },
				javascriptreact = { 'eslint_d' },
			}

			-- needs to be removed to be used with older eslint configuartions < 9
			local eslint_d = require('lint.linters.eslint_d')
			eslint_d.args = vim.tbl_extend('force', {
				'--config',
				function()
					return vim.fn.getcwd() .. '/eslint.config.js'
				end,
			}, eslint_d.args)

			local enabled = false
			local toggleLinter = function() end
			-- vim.api.nvim_create_user_command()

			vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
				callback = function()
					require('lint').try_lint()
				end,
			})
		end,
	},
}
