return {
  "ej-shafran/compile-mode.nvim",
  version = "^5.0.0",
  -- you can just use the latest version:
  -- branch = "latest",
  -- or the most up-to-date updates:
  -- branch = "nightly",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- if you want to enable coloring of ANSI escape codes in
    -- compilation output, add:
    { "m00qek/baleia.nvim", version = "*" },
  },
  config = function()
    vim.g.compile_mode = {
        -- to add ANSI escape code support, add:
        baleia_setup = true,
        error_locus_highlight = true,
        default_command = "",

        -- to make `:Compile` replace special characters (e.g. `%`) in
        -- the command (and behave more like `:!`), add:
        -- bang_expansion = true,
    }
    vim.keymap.set("n", "<C-i>", function () vim.cmd('below:Compile') end)
    vim.keymap.set("n", "<C-n>", function () vim.cmd('NextError') end)
    vim.keymap.set("n", "<C-m>", function () vim.cmd('below:Recompile') end)
  end
}
