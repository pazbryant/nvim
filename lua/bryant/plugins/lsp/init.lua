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
					require('conform').format({ async = true, lsp_format = 'fallback' })
				end,
				mode = '',
				desc = '[F]ormat buffer',
			},
		},
		opts = {
			notify_on_error = false,
			format_on_save = function(bufnr)
				local disable_filetypes = { c = true }
				local lsp_format_opt
				if disable_filetypes[vim.bo[bufnr].filetype] then
					lsp_format_opt = 'never'
				else
					lsp_format_opt = 'fallback'
				end
				return {
					timeout_ms = 500,
					lsp_format = lsp_format_opt,
				}
			end,
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
}
