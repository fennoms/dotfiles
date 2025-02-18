return {
	"lukas-reineke/virt-column.nvim",
	config = function()
		require("virt-column").setup()
		vim.cmd("set cc=80")
	end,
}
