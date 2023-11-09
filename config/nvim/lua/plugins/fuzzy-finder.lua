return {
    {
        "nvim-telescope/telescope.nvim",
        cmd = { "Telescope" },
        event = { "BufReadPre", "BufNewFile" },
        keys = {
            { "<leader>m", "<cmd>Telescope marks<cr>",      desc = "search by [M]arks" },
            -- { "<leader>f", "<cmd>Telescope find_files<cr>", desc = "search [F]iles" },
            { "<leader>g", "<cmd>Telescope live_grep<cr>",  desc = "search by [G]rep" },
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "nvim-telescope/telescope-ui-select.nvim",
            "nvim-telescope/telescope-file-browser.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        config = function()
            local telescope = require("telescope")
            local actions   = require("telescope.actions")

            -- options
            telescope.setup({
                defaults = {
                    path_display = { "truncate " },
                    file_ignore_patterns = {
                        "^.git/",
                        "^.cache/",
                    },
                    mappings = {
                        i = {
                            ["<C-u>"] = false,
                            ["<C-d>"] = false,
                            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                        },
                    },
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                            -- even more opts
                        }

                        -- pseudo code / specification for writing custom displays, like the one
                        -- for "codeactions"
                        -- specific_opts = {
                        --   [kind] = {
                        --     make_indexed = function(items) -> indexed_items, width,
                        --     make_displayer = function(widths) -> displayer
                        --     make_display = function(displayer) -> function(e)
                        --     make_ordinal = function(e) -> string
                        --   },
                        --   -- for example to disable the custom builtin "codeactions" display
                        --      do the following
                        --   codeactions = false,
                        -- }
                    },
                    file_browser = {
                        theme = "ivy",
                        -- disables netrw and use telescope-file-browser in its place
                        hijack_netrw = true,
                        mappings = {
                            ["i"] = {
                                -- your custom insert mode mappings
                            },
                            ["n"] = {
                                -- your custom normal mode mappings
                            },
                        },
                    },
                }
            })

            -- load extensions
            telescope.load_extension("fzf")
            telescope.load_extension("ui-select")
            telescope.load_extension("file_browser")

            -- keymaps
            --   See `:help telescope.builtin`
            -- vim.keymap.set("n", "<leader>f", require("telescope.builtin").find_files, { desc = "search [F]iles" })
            -- vim.keymap.set("n", "<leader>g", require("telescope.builtin").live_grep, { desc = "search by [G]rep" })
            -- vim.keymap.set("n", "<leader>gf", require("telescope.builtin").git_files, { desc = "Search [G]it [F]iles" })
            -- vim.keymap.set("n", "<leader>b", require("telescope.builtin").buffers, { desc = "Find existing [B]uffers" })
            vim.keymap.set("n", "<leader>h", require("telescope.builtin").help_tags, { desc = "search [H]elp" })
            vim.keymap.set("n", "<leader>w", require("telescope.builtin").grep_string, { desc = "search current [W]ord" })
            -- vim.keymap.set("n", "<leader>d", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })
            vim.keymap.set("n", "<leader>f", require("telescope").extensions.file_browser.file_browser, { desc = "file [F]inder" })
        end,
    },
}
