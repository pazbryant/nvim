return {
	{
		'neovim/nvim-lspconfig',
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = {
			'williamboman/mason.nvim',
			{
				'https://github.com/m-demare/hlargs.nvim',
				config = true,
			},
			{
				'kosayoda/nvim-lightbulb',
				config = function()
					require('nvim-lightbulb').setup({
						autocmd = { enabled = true },
					})
				end,
			},
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
}
