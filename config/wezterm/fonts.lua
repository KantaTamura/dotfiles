local wezterm = require("wezterm")

local Fonts = {}

function Fonts.setup(config)
    config.font = wezterm.font("PlemolJP Console NF", { weight = 'Medium' })
    config.font_size = 14
end

return Fonts
