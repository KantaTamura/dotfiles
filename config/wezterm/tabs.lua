local wezterm = require("wezterm")

local Tabs = {}

function Tabs.setup(config)
    config.tab_bar_at_bottom = true
    config.use_fancy_tab_bar = false
    config.show_new_tab_button_in_tab_bar = false
    config.tab_max_width = 50
    config.hide_tab_bar_if_only_one_tab = true
end

return Tabs
