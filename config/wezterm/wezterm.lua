local shell = require("shell")
local fonts = require("fonts")
local tabs  = require("tabs")

local config = {
    warn_about_missing_glyphs = false,
    show_update_window = false,
    check_for_updates = false,
    window_decorations = "RESIZE",
    window_close_confirmation = "NeverPrompt",
    window_padding = {
        left = 4,
        right = 4,
        top = 4,
        bottom = 4,
    },
    window_frame = {
        border_left_width = '0.5cell',
        border_right_width = '0.5cell',
        border_bottom_height = '0.25cell',
        border_top_height = '0.25cell',
        border_left_color = 'purple',
        border_right_color = 'purple',
        border_bottom_color = 'purple',
        border_top_color = 'purple',
    },
    initial_cols = 110,
    initial_rows = 25,
    inactive_pane_hsb = {
        saturation = 1.0,
        brightness = 0.90,
    },
    enable_scroll_bar = false,
    window_background_opacity = 1.0,
    hyperlink_rules = {
        {
            regex = "\\b\\w+://[\\w.-]+:[0-9]{2,15}\\S*\\b",
            format = "$0",
        },
        {
            regex = "\\b\\w+://[\\w.-]+\\.[a-z]{2,15}\\S*\\b",
            format = "$0",
        },
        {
            regex = [[\b\w+@[\w-]+(\.[\w-]+)+\b]],
            format = "mailto:$0",
        },
        {
            regex = [[\bfile://\S*\b]],
            format = "$0",
        },
        {
            regex = [[\b\w+://(?:[\d]{1,3}\.){3}[\d]{1,3}\S*\b]],
            format = "$0",
        },
        {
            regex = [[\b[tT](\d+)\b]],
            format = "https://example.com/tasks/?t=$1",
        },
    },

    color_scheme = "iceberg-dark",
}

shell.setup(config)
fonts.setup(config)
tabs.setup(config)

return config
