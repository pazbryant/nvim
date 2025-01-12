---@diagnostic disable: undefined-global

return {
	s('stylua:start', {
		t({ '-- stylua: ignore start', '' }),
		i(1),
	}),

	s('stylua:end', {
		t({ '-- stylua: ignore end', '' }),
		i(1),
	}),
}
