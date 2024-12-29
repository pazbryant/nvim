return {
	'folke/ts-comments.nvim',
	opts = {},
	ft = {
		'javascript',
		'typescript',
		'javascriptreact',
		'typescriptreact',
	},
	enabled = vim.fn.has('nvim-0.10.0') == 1,
}
