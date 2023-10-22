return {
    {
        "cocopon/iceberg.vim",
        event = "VimEnter",
        cond = true,
        config = function()
            vim.cmd.colorscheme "iceberg"
        end,
    }
}
