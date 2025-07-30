return {
    "fasterius/simple-zoom.nvim",
    opts = {
        hide_tabline = true
    },
    config = {
        vim.keymap.set('n', '<Leader>o', ":SimpleZoomToggle<CR>")
    }
}
