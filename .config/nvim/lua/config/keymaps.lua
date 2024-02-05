local keymap = vim.keymap

-- Directory Navigation
keymap.set("n","<leader>m",":NvimTreeFocus<CR>", {noremap = true, silent = true})
keymap.set("n","<leader>t",":NvimTreeToggle<CR>", {noremap = true, silent = true})

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
vim.api.nvim_set_keymap("n","<C-_>","gcc",{ noremap = false })
vim.api.nvim_set_keymap("v","<C-_>","gcc",{ noremap = false })
