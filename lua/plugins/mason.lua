return {
	"williamboman/mason.nvim",
	version = "1.11.0",
	dependencies = {
		{
			"williamboman/mason-lspconfig.nvim",
			version = "1.32.0",
		},
	},
	config = function()
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		require("mason-lspconfig").setup({
			ensure_installed = {
				"ts_ls",
				"tailwindcss",
				"emmet_ls",
				"cssls",
				"html",
			},
			automatic_installation = true,
			automatic_enable = false,
		})
	end,
}
