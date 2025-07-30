return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {
            "jdtls",
            "bashls",
            "gitlab_ci_ls",
            "gradle_ls",
            "gopls",
            "helm_ls",
            "lua_ls",
            "nginx_language_server",
            "pyright",
        }
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },

        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",

        "j-hui/fidget.nvim",

        {
            "neovim/nvim-lspconfig",
            config = function()
                require("fidget").setup()

                vim.lsp.config('lua_ls', {
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = {
                                    "vim",
                                    "buf_opts"
                                }
                            }
                        }
                    },
                })

                vim.lsp.config('jdtls', {
                    init_options = {
                        settings = {
                            java = {
                                imports = {
                                    gradle = {
                                        wrapper = {
                                            checksums = {
                                                {
                                                    sha256 = "7d3a4ac4de1c32b59bc6a4eb8ecb8e612ccd0cf1ae1e99f66902da64df296172",
                                                    allowed = true
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                })

                local cmp = require('cmp')
                local cmp_select = { behavior = cmp.SelectBehavior.Select }
                cmp.setup({
                    mapping = cmp.mapping.preset.insert({
                        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                        ['<Enter>'] = cmp.mapping.confirm({ select = true }),
                    }),
                    sources = cmp.config.sources({
                        { name = 'nvim_lsp' },
                        { name = 'buffer' },
                    })
                })

                vim.diagnostic.config({
                    update_in_insert = true,
                    float = {
                        border = "rounded",
                        source = "always",
                        header = "",
                        prefix = "",
                    },
                })

                vim.keymap.set("n", "[g", vim.diagnostic.goto_next)
                vim.keymap.set("n", "]g", vim.diagnostic.goto_prev)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
                vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action)
                vim.keymap.set("n", "gr", "<cmd>FzfLua lsp_references<cr>")
                vim.keymap.set("n", "gd", vim.lsp.buf.definition)
                vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help)
                end
            },
        },
    }
