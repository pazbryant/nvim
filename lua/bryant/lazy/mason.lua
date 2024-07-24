return {
	'williamboman/mason.nvim',
	lazy = true,
	event = 'BufEnter',
	dependencies = {
		'WhoIsSethDaniel/mason-tool-installer.nvim',
	},

	config = function()
		require('mason').setup()

		local ensure_installed = {
			-- web dev
			'stylua',
			'prettierd',
			'prettier',
			'eslint_d',

			-- bash
			'shellcheck',
			'shfmt',

			-- c
			'clang-format',

			-- golang
			'gofumpt',
			'goimports',
			'golangci-lint',
		}

		require('mason-tool-installer').setup({
			ensure_installed = ensure_installed,
		})

		vim.diagnostic.config({
			virtual_text = true,
		})
	end,
}
