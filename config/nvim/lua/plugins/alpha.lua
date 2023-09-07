return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    cond = true,
    -- dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local status, alpha = pcall(require, "alpha")
        if not status then
            return
        end
        alpha.setup(require "alpha.themes.dashboard".config)
    end
}
