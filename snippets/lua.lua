---@diagnostic disable: undefined-global

return {
	s('ignore:start', {
		t({ '-- stylua: ignore start', '' }),
		i(1),
	}),

	s('ignore:end', {
		t({ '-- stylua: ignore end', '' }),
		i(1),
	}),
}
