return  {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
    },
    config = function()
        local lspconfig = require('lspconfig')
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        -- Enable clangd for C/C++
        lspconfig.clangd.setup {
            capabilities = capabilities,
        }

        -- TypeScript / JavaScript (Next.js)
        lspconfig.ts_ls.setup {
            capabilities = capabilities,
            filetypes = {
                "javascript",
                "javascriptreact",
                "javascript.jsx",
                "typescript",
                "typescriptreact",
                "typescript.tsx",
            },
            settings = {
                completions = {
                    completeFunctionCalls = true,
                },
            },
        }

        -- Tailwind CSS
        lspconfig.tailwindcss.setup {
            capabilities = capabilities,
            filetypes = {
                "html",
                "css",
                "javascript",
                "javascriptreact",
                "typescript",
                "typescriptreact",
            },
        }

        -- Emmet (fast HTML/JSX expansion)
        lspconfig.emmet_ls.setup {
            capabilities = capabilities,
            filetypes = {
                "html",
                "css",
                "javascriptreact",
                "typescriptreact",
            },
        }

        -- CSS
        lspconfig.cssls.setup {
            capabilities = capabilities,
        }

        -- HTML
        lspconfig.html.setup {
            capabilities = capabilities,
        }

        -- Optional: nicer diagnostics
        vim.diagnostic.config({
          virtual_text = true,
          signs = true,
          underline = true,
          update_in_insert = false,
        })

        -- LSP keymaps (applied when an LSP attaches to a buffer)
        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(args)
                local opts = { buffer = args.buf, noremap = true, silent = true }
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
                vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
                vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)
                vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
                vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
            end,
        })
    end,
}

