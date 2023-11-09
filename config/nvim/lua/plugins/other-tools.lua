return {
    --
    -- ref. https://github.com/vim-jp/vimdoc-ja
    {
        "vim-jp/vimdoc-ja",
        lazy = true,
        keys = {
            { "h", mode = "c", desc = "open [H]elp" },
        },
    },
    --
    -- ref. https://github.com/folke/which-key.nvim
    {
        "folke/which-key.nvim",
        lazy = true,
        cmd = {
            "WhichKey",
        },
        opts = {},
    },
    --
    -- ref. https://github.com/simeji/winresizer
    {
        "simeji/winresizer",
        event = { "BufReadPre", "BufNewFile" },
    },
    --
    -- ref. https://github.com/folke/trouble.nvim
    {
        "folke/trouble.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },
    --
    -- ref. https://github.com/folke/todo-comments.nvim
    {
        "folke/todo-comments.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
    --
    -- ref. https://github.com/github/copilot.vim
    {
        "github/copilot.vim",
        event = "InsertEnter",
        cond = function()
            return not vim.g.vscode
        end,
        filetypes = {
            markdown = true,
            help = true,
        },
    },
    --
    -- ref. https://github.com/nvim-pack/nvim-spectre
    {
        'nvim-pack/nvim-spectre',
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        cmd = "Spectre",
    },
    --
    -- ref. https://github.com/akinsho/toggleterm.nvim
    {
        'akinsho/toggleterm.nvim',
        keys = {
            { "<leader>l", "<cmd>lua _lazygit_toggle()<CR>", desc = "open [L]azygit" },
        },
        opts = {
            autochdir = true,
        },
        config = function()
            local Terminal = require("toggleterm.terminal").Terminal
            local lazygit = Terminal:new({ cmd = "lazygit", direction = "float", hidden = true })
            function _lazygit_toggle()
                lazygit:toggle()
            end
        end
    }
}
