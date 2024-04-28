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
		mapvimkey("<leader>fh", "Telescope help_tags", "[F]ind [H]elp "),
		mapvimkey("<leader>fk", "Telescope keymaps", "[F]ind [K]eymaps"),
		mapvimkey("<leader>ff", "Telescope find_files", "[F]ind [F]iles"),
		mapvimkey("<leader>fs", "Telescope builtin", "[F]ind [S]elect Telescope"),
		mapvimkey("<leader>fw", "Telescope grep_string", "[F]ind Current [W]ord"),
		mapvimkey("<leader>fg", "Telescope live_grep", "Live [G]rep"),
		mapvimkey("<leader>fd", "Telescope diagnostics", "[F]ind [D]iagnostics"),
		mapvimkey("<leader>f.", "Telescope oldfiles", "[F]ind recent files ( . for repeat)"),
		mapvimkey("<leader>fb", "Telescope buffers", "[F]ind [B]uffers"),
		mapvimkey("<leader><leader>", "Telescope buffers", "Find Existing Buffers"),
	},
}
