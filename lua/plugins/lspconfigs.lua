return  {
    'neovim/nvim-lspconfig',
    config = function()
        local lspconfig = require('lspconfig')

        -- Enable clangd for C/C++
        lspconfig.clangd.setup {}

        -- Optional: nicer diagnostics
        vim.diagnostic.config({
          virtual_text = true,
          signs = true,
          underline = true,
          update_in_insert = false,
        })
    end,
}

