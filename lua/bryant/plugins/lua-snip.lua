return {
	'L3MON4D3/LuaSnip',
	dependencies = {
		'rafamadriz/friendly-snippets',
	},
	config = function()
		local ls = require('luasnip')

		ls.config.set_config({
			history = true, -- keep around last snippet local to jump back
			updateevents = 'TextChanged,TextChangedI', -- Update as you type
			enable_autosnippets = true,
			ext_opts = {
				[require('luasnip.util.types').choiceNode] = {
					active = {
						virt_text = { { '●', 'GruvboxOrange' } },
					},
				},
			},
		})

		require('luasnip.loaders.from_vscode').lazy_load({
			exclude = { 'sh', 'bash' },
		})

		require('luasnip.loaders.from_lua').lazy_load({
			paths = { './snippets' },
		})

		ls.filetype_extend('javascript', { 'javascriptreact' })
		ls.filetype_extend('typescript', { 'javascript' })
		ls.filetype_extend('typescriptreact', { 'javascript', 'typescript' })

		local map = vim.keymap.set

		map({ 'i', 's' }, '<C-l>', function()
			if ls.expand_or_jumpable() then
				ls.expand_or_jump()
			end
		end, { silent = true })

		map({ 'i', 's' }, '<C-h>', function()
			if ls.jumpable(-1) then
				ls.jump(-1)
			end
		end, { silent = true })

		map('i', '<C-e>', function()
			if ls.choice_active() then
				ls.change_choice(1)
			end
		end, { silent = true })
	end,
}
