return {
    "laytan/cloak.nvim",
    config = function ()
        require("cloak").setup({
            enabled = true,
            cloak_telescope = true,
            cloak_on_leave = false,
        })
    end
}
