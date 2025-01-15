local M = {}

function M.get_keymaps()
	return {
		{ 'go', vim.diagnostic.open_float, desc = 'Line Diagnostics' },
		{ 'gd', vim.lsp.buf.definition, desc = 'Goto Definition' },
		{ 'gR', vim.lsp.buf.references, desc = 'References' },
		{ 'gD', vim.lsp.buf.declaration, desc = 'Goto Declaration' },
		{ 'gI', vim.lsp.buf.implementation, desc = 'Goto Implementation' },
		{ 'gt', vim.lsp.buf.type_definition, desc = 'Goto Type Definition' },
		{
			'<C-i>',
			vim.lsp.buf.signature_help,
			desc = 'Signature Help',
			has = 'signatureHelp',
		},
		{ ']d', M.diagnostic_goto(true), desc = 'Next Diagnostic' },
		{ '[d', M.diagnostic_goto(false), desc = 'Prev Diagnostic' },
		{ ']e', M.diagnostic_goto(true, 'ERROR'), desc = 'Next Error' },
		{ '[e', M.diagnostic_goto(false, 'ERROR'), desc = 'Prev Error' },
		{ ']w', M.diagnostic_goto(true, 'WARN'), desc = 'Next Warning' },
		{ '[w', M.diagnostic_goto(false, 'WARN'), desc = 'Prev Warning' },
		{ '<leader>rn', M.rename, expr = true, desc = 'Rename', has = 'rename' },
		{
			'<leader>ca',
			vim.lsp.buf.code_action,
			desc = 'Code Action',
			mode = { 'n', 'v' },
			has = 'codeAction',
		},
	}
end

function M.rename()
	if pcall(require, 'inc_rename') then
		return ':IncRename ' .. vim.fn.expand('<cword>')
	else
		vim.lsp.buf.rename()
	end
end

function M.diagnostic_goto(next, severity)
	local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
	severity = severity and vim.diagnostic.severity[severity] or nil
	return function()
		go({ severity = severity })
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
		if not keys.has or client.server_capabilities[keys.has .. 'Provider'] then
			local opts = Keys.opts(keys)
			opts.has = nil
			opts.silent = true
			opts.buffer = buffer
			vim.keymap.set(keys.mode or 'n', keys.lhs, keys.rhs, opts)
		end
	end
end

return M
