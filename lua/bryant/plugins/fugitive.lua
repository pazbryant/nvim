return {
	'tpope/vim-fugitive',
	event = 'VeryLazy',
	keys = {
    -- stylua: ignore start
    { '<leader>gs', vim.cmd.Git, desc = 'Fugitive init' },
    { '<leader>gd', '<cmd>Gvdiffsplit!<CR>', desc = 'Fugitive diff split' },
    {'<leader>gu', '<cmd>diffget //2<CR>',  desc = 'Fugitive ours changes' },
    { '<leader>gh', '<cmd>diffget //3<CR>', desc = 'Fugitive theirs changes' },
	},
}
