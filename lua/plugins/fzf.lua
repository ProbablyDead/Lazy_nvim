return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    -- dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
    opts = function()
        local fzf = require('fzf-lua')
        vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "Find Files (fzf-lua)" })
        vim.keymap.set("n", "<leader>fg", fzf.live_grep, { desc = "Live Grep (fzf-lua)" })
        vim.keymap.set("n", "<leader>gg", fzf.git_files, { desc = "List Git files (fzf-lua)" })
    end,
}
