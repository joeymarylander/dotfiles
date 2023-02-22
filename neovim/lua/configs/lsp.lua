local coq = require('coq')
require('lsp-setup').setup({
    -- nvim-lsp-installer
    -- https://github.com/williamboman/nvim-lsp-installer#configuration
    installer = {},
    -- Default mappings
    -- gD = 'lua vim.lsp.buf.declaration()',
    -- gd = 'lua vim.lsp.buf.definition()',
    -- gt = 'lua vim.lsp.buf.type_definition()',
    -- gi = 'lua vim.lsp.buf.implementation()',
    -- gr = 'lua vim.lsp.buf.references()',
    -- K = 'lua vim.lsp.buf.hover()',
    -- ['<C-k>'] = 'lua vim.lsp.buf.signature_help()',
    -- ['<space>rn'] = 'lua vim.lsp.buf.rename()',
    -- ['<space>ca'] = 'lua vim.lsp.buf.code_action()',
    -- ['<space>f'] = 'lua vim.lsp.buf.formatting()',
    -- ['<space>e'] = 'lua vim.diagnostic.open_float()',
    -- ['[d'] = 'lua vim.diagnostic.goto_prev()',
    -- [']d'] = 'lua vim.diagnostic.goto_next()',
    mappings = {
        gd = 'lua require"telescope.builtin".lsp_definitions()',
        gi = 'lua require"telescope.builtin".lsp_implementations()',
        gr = 'lua require"telescope.builtin".lsp_references()',
    },
    capabilities = vim.lsp.protocol.make_client_capabilities(),
    -- Configuration of LSP servers
    servers = {
        bashls = {},
        dockerls = {},
        html = {},
        jsonls = {},
        jdtls = {
            on_attach = function(_, _)
            end
        },
        tsserver = {
            on_attach = function(client, bufnr)
                client.server_capabilities.documentFormattingProvider = false
            end
        },
        eslint = {
            settings = {
                format = {
                    enable = true,
                },
            }
        },
        sumneko_lua = require('neodev').setup({}),
        pyright = {},
        solargraph = {},
        yamlls = {
            settings = {
                yaml = {
                    customTags = {
                        "!Equals sequence", "!FindInMap sequence", "!GetAtt scalar", "!GetAtt", "!GetAZs scalar",
                        "!ImportValue scalar", "!Join sequence scalar", "!Ref scalar", "!Select sequence",
                        "!Split sequence", "!Sub scalar", "!And sequence", "!Not sequence", "!Equals sequence",
                        "!Sub sequence", "!ImportValue scalar", "!If sequence", "!Condition scalar", "!Or sequence"
                    }
                }
            }
        }

        -- Install LSP servers automatically
        -- LSP server configuration please see: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
        -- pylsp = {},
        -- rust_analyzer = {
        --     settings = {
        --         ['rust-analyzer'] = {
        --             cargo = {
        --                 loadOutDirsFromCheck = true,
        --             },
        --             procMacro = {
        --                 enable = true,
        --             },
        --         },
        --     },
        -- },
    },
})

require('lsp_lines').setup()

-- global config for diagnostic
vim.diagnostic.config({
    underline = true,
    virtual_text = false,
})

require('lsp_signature').setup()
require('lsp-colors').setup()

local border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' }
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })
