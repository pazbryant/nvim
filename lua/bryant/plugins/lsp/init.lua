return {
	{
		'folke/lazydev.nvim',
		ft = 'lua',
		opts = {
			library = {
				{ path = 'luvit-meta/library', words = { 'vim%.uv' } },
				{ path = 'LazyVim', words = { 'LazyVim' } },
			},
		},
	},

	{ 'Bilal2453/luvit-meta', lazy = true },

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

	{
		'neovim/nvim-lspconfig',
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = {
			'williamboman/mason.nvim',
			'j-hui/fidget.nvim',
			'williamboman/mason-lspconfig.nvim',
		},
	},

	{
		'm-demare/hlargs.nvim',
		event = { 'BufReadPost', 'BufNewFile' },
		opts = {
			hl_priority = 200,
			extras = { named_parameters = true },
		},

		config = true,
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

				-- toml
				'taplo',
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
}
