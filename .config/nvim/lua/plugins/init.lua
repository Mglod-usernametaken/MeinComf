vim.filetype.add({
	extension = {
		tofu = "terraform",
	},
})
return{
	{ "folke/neoconf.nvim", cmd = "Neoconf" },
	"folke/neodev.nvim",
}
