return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = {
        { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find: Files" },
        { "<leader>fg", function() require("telescope.builtin").live_grep() end,  desc = "live_grep" },
        { "<leader>gg", function() require("telescope.builtin").live_grep() end,  desc = "git_files" },
    },
    config = function()
        local actions = require("telescope.actions")
        require("telescope").setup {
            defaults = {
                -- cut --
            },
        }
    end
}
