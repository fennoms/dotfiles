return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		-- Define the toggle_nvimtree function
		local toggle_nvimtree = function()
			if vim.fn.bufname():match("NvimTree_") then
				vim.cmd.wincmd("p")
			else
				vim.cmd("NvimTreeFindFile")
			end
		end

		-- Setup nvim-tree
		require("nvim-tree").setup()

		-- Set keymaps
		vim.keymap.set("n", "<C-b>", "<cmd>NvimTreeToggle<cr>", { silent = true })
		vim.keymap.set("n", "<C-l>", function()
			toggle_nvimtree()
		end, { silent = true })
		vim.keymap.set(
			"n",
			"<C-e>",
			"<cmd>:lua require('nvim-tree.api').tree.toggle(false, true)<CR>",
			{ silent = true }
		)
	end,
}
