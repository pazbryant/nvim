vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics,
	{ underline = true, update_in_insert = false }
)

vim.diagnostic.config({
	update_in_insert = false,
	underline = true,
	severity_sort = true,
	virtual_text = true,
	float = {
		focusable = true,
		style = 'minimal',
		border = 'single',
		source = true,
		max_width = 100,
		header = { ' Diagnostics', 'Bold' },
		prefix = function(ctx)
			local severity = vim.diagnostic.severity[ctx.severity]
			return '  ', 'Diagnostic' .. severity
		end,
	},
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = 'single',
})

vim.lsp.handlers['textDocument/signatureHelp'] =
	vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = 'single',
	})

local function on_attach(client, bufnr)
	require('bryant.plugins.lsp.attach').on_attach(client, bufnr)
end

local capabilities = vim.tbl_deep_extend(
	'force',
	{},
	vim.lsp.protocol.make_client_capabilities(),
	require('cmp_nvim_lsp').default_capabilities()
)

local servers = {
	gopls = {
		cmd = { 'gopls' },
		capabilities = capabilities,
		settings = {
			gopls = {
				experimentalPostfixCompletions = true,
				analyses = {
					unusedparams = true,
					shadow = true,
				},
				staticcheck = true,
			},
		},
		init_options = {
			usePlaceholders = true,
		},
	},
	lua_ls = {
		settings = {
			Lua = {
				runtime = { version = 'LuaJIT' },
				telemetry = { enable = false },
				diagnostics = {
					globals = {
						'vim',
						'describe',
						'it',
						'before_each',
						'after_each',
						'peding',
					},
				},
			},
		},
	},
}

local ignored_servers = { 'ts_ls' }
require('mason-lspconfig').setup({
	handlers = {
		function(server)
			local server_opts = vim.tbl_deep_extend('force', {
				capabilities = vim.deepcopy(capabilities),
			}, servers[server] or {})

			if vim.tbl_contains(ignored_servers, server) then
				return
			end

			server_opts.on_attach = on_attach
			require('lspconfig')[server].setup(server_opts)
		end,
	},
})
