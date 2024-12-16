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
		cmd = { 'ConformInfo', 'FormatDisable' },
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
		opts = {
			linters_by_ft = {
				sh = { 'shellcheck' },
				bash = { 'shellcheck' },
				zsh = { 'shellcheck' },
				lua = { 'luacheck' },
				c = { 'clangtidy' },
				go = { 'golangcilint' },
				python = { 'ruff' },
				markdown = { 'alex', 'markdownlint' },
				javascript = { 'eslint_d' },
				typescript = { 'eslint_d' },
				typescriptreact = { 'eslint_d' },
				javascriptreact = { 'eslint_d' },
			},
			linters = {
				luacheck = {
					condition = function(ctx)
						local root = LazyVim.root.get({ normalize = true })
						if root ~= vim.uv.cwd() then
							return false
						end
						return vim.fs.find(
							{ '.luacheckrc' },
							{ path = root, upward = true }
						)[1]
					end,
				},
			},
		},
	},
}
