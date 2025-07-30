local function IsZoomedIn()
    if vim.t['simple-zoom'] == nil then
        return ''
    elseif vim.t['simple-zoom']== 'zoom' then
        return '󰍉'
    end
end

return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup {
            sections = {
                lualine_a = {
                    { 'filename' },
                    { IsZoomedIn },
                }
            }
        }
    end
}
