return {
	'williamboman/mason.nvim',
	dependencies = 'WhoIsSethDaniel/mason-tool-installer.nvim',
	branch = 'main',
	cmd = 'Mason',
	config = function()
		local ensure_installed = {
			-- lua
			'stylua',

			-- web dev
			'prettierd',
			'prettier',

			-- bash
			'shfmt',

			-- c
			'clang-format',

			-- golang
			'gofumpt',
			'goimports',

			-- python
			'black',
			'isort',
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
}
