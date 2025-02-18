return {
	"stevearc/conform.nvim",

	config = function()
		require("conform").setup({
			-- Add formatters here. See the conform.nvim
			-- documentation for details.
			formatters_by_ft = {
				lua = { "stylua" },
				bash = { "shfmt" },
				c = { "clang_format" },
				python = { "black", "isort" },
			},

			-- Auto format on save
			format_on_save = {
				timeout = 500,
			},

			-- Formatter settings
			formatters = {
				clang_format = {
					prepend_args = { "-style=file", "-fallback-style=Google" },
				},
			},
		})

		-- Format with <leader>cf
		vim.keymap.set("n", "<leader>cf", "<cmd>lua require('conform').format()<cr>", { noremap = true, silent = true })
	end,
}
