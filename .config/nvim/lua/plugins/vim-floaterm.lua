return {
	"voldikss/vim-floaterm",
	lazy = false,
	config = function()
		vim.g.floaterm_keymap_new = "<Leader>e"
		vim.g.floaterm_keymap_toggle = "<Leader>i"
		vim.g.floaterm_titleposition = "center"
	end,
}
