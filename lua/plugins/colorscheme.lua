return {
    priority = 1000, -- make sure to load this before all the other start plugins
    lazy = false,

    -- "catppuccin/nvim",
    -- config = function ()
    --         require("catppuccin").setup({
    --                 flavour = "latte"
    --             })
    --             vim.cmd("colorscheme catppuccin")
    -- end,

    "navarasu/onedark.nvim",
    config = function()
        require('onedark').setup {
            style = 'light'
        }
        -- Enable theme
        require('onedark').load()
    end

}
