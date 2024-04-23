local mapvimkey = require("util.keymapper").mapvimkey

local config = function()
	local telescope = require("telescope")
	telescope.setup({
		defaults = {
			mappings = {
				i = {
					["<C-j>"] = "move_selection_next",
					["<C-k>"] = "move_selection_previous",
				},
			},
		},
		pickers = {
			find_files = {
				theme = "dropdown",
				previewer = true,
				hidden = true,
			},
			live_grep = {
				theme = "dropdown",
				previewer = true,
			},
			buffers = {
				theme = "dropdown",
				previewer = true,
			},
		},
	})
end

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	lazy = false,
	dependencies = { "nvim-lua/plenary.nvim" },
	config = config,
	keys = {
		mapvimkey("<leader>fk", "telescope keymaps", "show keymaps"),
		mapvimkey("<leader>fh", "telescope help_tags", "show help tags"),
		mapvimkey("<leader>ff", "telescope find_files", "find files"),
		mapvimkey("<leader>fg", "telescope live_grep", "live grep"),
		mapvimkey("<leader>fb", "telescope buffers", "find buffers"),
	},
}
