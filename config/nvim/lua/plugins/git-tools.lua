return {
	--
	-- ref. https://github.com/tpope/vim-fugitive
	{
		"tpope/vim-fugitive",
		event = { "BufReadPre", "BufNewFile" },
		cond = function()
			return not vim.g.vscode
		end,
		-- event = "VeryLazy",
		keys = {
			{ "git", mode = "c", "<cmd>Git<cr>", desc = "OpenGit" },
		},
		dependencies =
		{
			"tpope/vim-rhubarb",
		},
	},
	--
	-- ref. https://github.com/sindrets/diffview.nvim
	{
		"sindrets/diffview.nvim",
		cmd = {
			"DiffviewOpen"
		},
		opts = {
			default_args = {
				DiffviewOpen = { "--imply-local" },
			}
		},
	},
	--
	-- ref. https://github.com/lewis6991/gitsigns.nvim
	{
		-- Adds git releated signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		cond = function()
			return not vim.g.vscode
		end,
		opts = {
			-- See `:help gitsigns.txt`
			signs = {
				add          = { text = "┆" },
				change       = { text = "┆" },
				delete       = { text = "" },
				topdelete    = { text = "" },
				changedelete = { text = "~" },
				untracked    = { text = "┆" },
			},
		},
	}
}
