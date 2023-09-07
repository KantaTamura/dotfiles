local scheme = "iceberg"

return {
    {
        "cocopon/iceberg.vim",
        event = "VimEnter",
        cond = function()
            return scheme == "iceberg"
        end,
        config = function()
            vim.cmd.colorscheme "iceberg"
        end,
    },
}
