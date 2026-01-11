return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {
            "jdtls",
            "gopls",
            "pyright",
            "gradle_ls",
            "kotlin_language_server",
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

                local lspconfig = require('lspconfig')

                vim.lsp.config('kotlin_language_server', {
                    filetypes = { "kotlin", "kotlin-script" },
                    -- root_dir = function()
                    --     return vim.loop.cwd() -- or vim.fn.getcwd()
                    -- end,
                    -- cmd = { "kotlin-language-server" },
                    -- root_dir = require('lspconfig.util').root_pattern('settings.gradle', 'build.gradle', '.git') or vim.fn.getcwd(),
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
                vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help)
                end
            },
        },
    }
