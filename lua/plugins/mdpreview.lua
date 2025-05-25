return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
        vim.g.mkdp_filetypes = { "markdown" }

        vim.keymap.set("n", "<C-p>", function() vim.cmd.MarkdownPreviewToggle() end)
    end,
    ft = { "markdown" },
}
