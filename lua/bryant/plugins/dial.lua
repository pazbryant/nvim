return {
	'monaqa/dial.nvim',
	config = function()
		local augend = require('dial.augend')
		require('dial.config').augends:register_group({
			default = {
				augend.integer.alias.decimal,
				augend.integer.alias.hex,
				augend.semver.alias.semver,
				augend.date.alias['%Y/%m/%d'],
				augend.constant.alias.bool,
				augend.constant.new({ elements = { 'and', 'or' } }),
				augend.constant.new({
					elements = { '&&', '||' },
					word = false,
				}),
			},
		})
	end,
	keys = {
		-- stylua: ignore start
		{ '<C-b>', function() return require('dial.map').manipulate('increment', 'normal') end, desc = 'Dial Increment' },
		{ '<C-x>', function() return require('dial.map').manipulate('decrement', 'normal') end, desc = 'Dial Decrement' },
		{ 'g<C-b>', function() return require('dial.map').manipulate('increment', 'gnormal') end, desc = 'Dial GIncrement' },
		{ 'g<C-x>', function() return require('dial.map').manipulate('decrement', 'gnormal') end, desc = 'Dial GDecrement' },
		{ '<C-b>', function() return require('dial.map').manipulate('increment', 'visual') end, mode = 'v', desc = 'Dial Visual increment' },
		{ '<C-x>', function() return require('dial.map').manipulate('decrement', 'visual') end, mode = 'v', desc = 'Dial Visual Decrement' },
		{ 'g<C-b>', function() return require('dial.map').manipulate('increment', 'gvisual') end, mode = 'v', desc = 'Dial Visual GIncrement' },
		{ 'g<C-x>', function() return require('dial.map').manipulate('decrement', 'gvisual') end, mode = 'v', desc = 'Dial Visual GDecrement' },
	},
}
