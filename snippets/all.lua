---@diagnostic disable: undefined-global

return {
	-- TODO
	s('todo', {
		t('TODO: '),
		i(1, 'describe what needs to be done'),
	}),

	--- FIX
	s('fix', {
		t('FIX: '),
		i(1, 'describe what needs to be done'),
	}),

	-- HACK
	s('hack', {
		t('HACK: '),
		i(1, 'explain the workaround or hack here'),
	}),

	-- WARN
	s('warn', {
		t('WARN: '),
		i(1, 'explain the warning here'),
	}),

	-- PERF
	s('perf', {
		t('PERF: '),
		i(1, 'describe the performance issue or suggestion'),
	}),

	-- NOTE
	s('note', {
		t('NOTE: '),
		i(1, 'add a note or explanation here'),
	}),

	-- TEST
	s('test', {
		t('TEST: '),
		i(1, 'describe the test case or issue here'),
	}),
}
