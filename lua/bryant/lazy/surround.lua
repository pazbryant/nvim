return {
	'https://github.com/tpope/vim-surround/',
	dependencies = 'https://github.com/tpope/vim-repeat',
	lazy = false,
}

-- Surround.vim Cheat sheet

-- Change Surroundings:
-- cs"'   -- 'Hello world!'    (Change " to ')
-- cs'<q>  -- <q>Hello world!</q> (Change ' to <q> and wrap in <q>...</q>)
-- cst"    -- "Hello world!"     (Change <q> to ")

-- Delete Surroundings:
-- ds"     -- Hello world!       (Delete surrounding quotes)
-- ds{     -- Hello world!       (Delete surrounding braces)
-- ds)     -- Hello world!       (Delete surrounding parentheses)

-- Yank & Surround Text Objects:
-- ysiW]   -- [Hello] world!     (Surround inner word with [])
-- ysiw]   -- [Hello] world!     (Surround inner word with [])
-- ysiw<em> -- <em>Hello</em> world! (Surround inner word with <em>...</em>)

-- Surround Entire Line:
-- yssb    -- ({ Hello } world!) (Surround whole line with braces {})
-- yss)    -- ({ Hello } world!) (Surround whole line with parentheses ())

-- Visual Mode:
-- V S<p>  -- <p>Hello world!</p> (Surround selected line with <p>...</p>)
