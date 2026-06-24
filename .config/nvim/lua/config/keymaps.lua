local keymap = vim.keymap

-- Directory Navigation
keymap.set("n", "<leader>m", ":NvimTreeFocus<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Pane Navigation
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Window Splitting

keymap.set("n", "<leader>sv", ":vsplit<CR>", opts)
keymap.set("n", "<leader>sh", ":split<CR>", opts)
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", opts)

--keymap.set('n', '<leader>ff', builtin.find_files, {})
--keymap.set('n', '<leader>fg', builtin.live_grep, {})
--keymap.set('n', '<leader>fb', builtin.buffers, {})
--keymap.set('n', '<leader>fh', builtin.help_tags, {})
--
vim.api.nvim_set_keymap("n", "<C-_>", "gcc", { noremap = false })
vim.api.nvim_set_keymap("v", "<C-_>", "gcc", { noremap = false })

keymap.set("v", ">", ">gv")
keymap.set("v", "<", "<gv")

keymap.set("n", "<leader>`", ":FloatermNew<CR>", opts)
keymap.set("n", "<leader>h", ":FloatermKill<CR>", opts)
keymap.set("n", "<leader>e", ":FloatermToggle<CR>", opts)

-- Folding
keymap.set("n", "<leader>z", "za", { noremap = true, silent = true })

-- Diagnostics
keymap.set(
	"n",
	"<leader>x",
	":lua vim.diagnostic.open_float(nil, {focusable = false })<CR>",
	{ noremap = true, silent = true }
)
function ToggleVirtTxt()
	vim.g.diagnostics_virtual_text = not vim.g.diagnostics_virtual_text
	vim.diagnostic.config({ virtual_text = vim.g.diagnostics_virtual_text })
end

keymap.set("n", "<leader>X", ":lua ToggleVirtTxt()<CR>", { noremap = true, silent = true })

-- Definitions
keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP hover" })
