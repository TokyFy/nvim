return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp", -- Source for LSP completions
	},
	config = function()
		-- nvim-cmp setup for LSP
		local cmp = require('cmp')
		cmp.setup({
			completion = {
				completeopt = 'menu,menuone,noinsert',
			},
			snippet = {
				expand = function(args)
					vim.fn["vsnip#anonymous"](args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				['<C-Space>'] = cmp.mapping.complete(),
				['<C-e>'] = cmp.mapping.close(),
				['<CR>'] = cmp.mapping.confirm({ select = true }),
			}),
			sources = {
				{ name = 'nvim_lsp' }, -- Enable LSP completion
			},
		})
	end,
}
