local keymap = vim.keymap

local M = {}

--set keymaps on the active lsp server
M.on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	keymap.set("n", "<leader>gD", "<cmd>Lspsaga goto_definition<CR>", opts)
	keymap.set("n", "<leader>ca", "<cmd>Lspsaga goto_definition<CR>", opts)
	keymap.set("n", "<leader>rn", "<cmd>Lspsaga goto_definition<CR>", opts)
	keymap.set("n", "<leader>D", "<cmd>Lspsaga goto_definition<CR>", opts)
	keymap.set("n", "<leader>d", "<cmd>Lspsaga goto_definition<CR>", opts)
	keymap.set("n", "<leader>pd", "<cmd>Lspsaga goto_definition<CR>", opts)
	keymap.set("n", "<leader>nd", "<cmd>Lspsaga goto_definition<CR>", opts)
	keymap.set("n", "K", "<cmd>Lspsaga goto_definition<CR>", opts)

	if client.name == "pyright" then
		keymap.set("n", "<Leader>oi", "<cmd>PyrightOrganizeImports<CR>", opts)
	end
end

return M
