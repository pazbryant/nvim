return {
	'williamboman/mason.nvim',
	lazy = false,
	dependencies = {
		'WhoIsSethDaniel/mason-tool-installer.nvim',
	},
	config = function()
		require('mason').setup()
		local ensure_installed = {}
		vim.list_extend(ensure_installed, {
			-- web dev
			'stylua',
			'prettierd',
			'prettier',

			-- bash
			'shfmt',

			-- c
			'clang-format',

			-- golang
			'gofumpt',
			'goimports',
		})
		require('mason-tool-installer').setup({
			ensure_installed = ensure_installed,
		})
	end,
}
