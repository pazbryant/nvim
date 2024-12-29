local lspconfig = require('lspconfig')
local mason_lspconfig = require('mason-lspconfig')
if not mason_lspconfig or not lspconfig then
	return
end

vim.lsp.handlers['textDocument/publishDiagnostics'] =
	vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { underline = true, update_in_insert = false })

vim.diagnostic.config({
	update_in_insert = false,
	underline = true,
	severity_sort = true,
	virtual_text = false,
	signs = {
		text = { ERROR = '󰅚', WARN = '󰀪', HINT = '󰌶', INFO = '󰋽' },
	},
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

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
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
	bashls = {},
	gopls = {
		cmd = { 'gopls' },
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
						'LazyVim',
					},
				},
			},
		},
	},
}

local setup = {}

local ignored_servers = { 'ts_ls' }
mason_lspconfig.setup_handlers({
	function(server)
		local server_opts = vim.tbl_deep_extend('force', {
			capabilities = vim.deepcopy(capabilities),
		}, servers[server] or {})

		if vim.tbl_contains(ignored_servers, server) then
			return
		end

		server_opts.on_attach = on_attach

		if setup[server] then
			if setup[server](server, server_opts) then
				return
			end
		elseif setup['*'] then
			if setup['*'](server, server_opts) then
				return
			end
		end

		require('lspconfig')[server].setup(server_opts)
	end,
})
