return {
	"akinsho/nvim-bufferline.lua",
	config = function()
		require("bufferline").setup({
			options = {
				diagnostics = "nvim_lsp",
			},
		})
	end,
}
