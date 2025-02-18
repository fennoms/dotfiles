return {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },

    opts = {
        -- Define LSPs here, they will be enabled automatically.
        -- see :help lspconfig-all for the list of lsps
	-- note: they must be installed on your system.
        servers = {
            lua_ls = {},
	        pyright = {},
	        clangd = {},
            bashls = {},
        }
    },

    config = function(_, opts)
        local lspconfig = require("lspconfig")
        for server, config in pairs(opts.servers) do
            config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
            lspconfig[server].setup(config)
        end

        -- Keybindings
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
    end
}
