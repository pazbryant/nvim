local M = {}

function M.get_keymaps()
	return {
    -- stylua: ignore start
    { 'grr', vim.lsp.buf.references, desc = 'References' },
    { 'grn', vim.lsp.buf.rename, desc = 'Rename' },
    { 'gO', vim.lsp.buf.document_symbol, desc = 'Open document symbol' },
    { 'gd', vim.lsp.buf.definition, desc = 'Goto Definition' },
    { ']d', M.diagnostic_goto(true), desc = 'Next Diagnostic' },
    { 'gD', vim.lsp.buf.declaration, desc = 'Goto Declaration' },
    { '[d', M.diagnostic_goto(false), desc = 'Prev Diagnostic' },
    { ']e', M.diagnostic_goto(true, 'ERROR'), desc = 'Next Error' },
    { '[e', M.diagnostic_goto(false, 'ERROR'), desc = 'Prev Error' },
    { ']w', M.diagnostic_goto(true, 'WARN'), desc = 'Next Warning' },
    { '[w', M.diagnostic_goto(false, 'WARN'), desc = 'Prev Warning' },
    { 'gri', vim.lsp.buf.implementation, desc = 'Goto Implementation' },
    { 'gt', vim.lsp.buf.type_definition, desc = 'Goto Type Definition' },
    { 'K', function() vim.lsp.buf.hover({ border = 'single' }) end, desc = 'LSP Hover' },
    { 'gra', vim.lsp.buf.code_action, desc = 'Code Action', mode = { 'n', 'v' } },
    { '<c-s>', function() vim.lsp.buf.signature_help({ border = 'single' }) end, desc = 'Signature Help' },
	}
end

function M.diagnostic_goto(next, severity)
	severity = severity and vim.diagnostic.severity[severity] or nil

	local opts = { float = true, severity = severity }
	if next then
		opts.count = 1
	else
		opts.count = -1
	end

	return function()
		vim.diagnostic.jump(opts)
	end
end

function M.on_attach(client, buffer)
	local Keys = require('lazy.core.handler.keys')
	local keymaps = {}

	for _, value in ipairs(M.get_keymaps()) do
		local keys = Keys.parse(value)
		if keys[2] == vim.NIL or keys[2] == false then
			keymaps[keys.id] = nil
		else
			keymaps[keys.id] = keys
		end
	end

	for _, keys in pairs(keymaps) do
		local opts = Keys.opts(keys)
		opts.has = nil
		opts.silent = true
		opts.buffer = buffer
		vim.keymap.set(keys.mode or 'n', keys.lhs, keys.rhs, opts)
	end
end

return M
