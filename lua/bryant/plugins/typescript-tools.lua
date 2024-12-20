return {
	'pmizio/typescript-tools.nvim',
	dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
	opts = {
		complete_function_calls = true,
		expose_as_code_action = 'all',
		separate_diagnostic_server = true,
	},
	ft = {
		'javascript',
		'typescript',
		'javascriptreact',
		'typescriptreact',
	},
	config = function(_, opts)
		require('typescript-tools').setup(opts)
	end,
}
