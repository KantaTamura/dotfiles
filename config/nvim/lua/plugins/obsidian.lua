return {
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		event = {
			"BufReadPre " .. vim.fn.expand("~") .. "/notes/*.md",
			"BufNewFile " .. vim.fn.expand("~") .. "/notes/*.md",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			workspaces = {
				{
					name = "notes",
					path = "~/notes",
				}
			}
		}
	},
	{
		"oflisback/obsidian-bridge.nvim",
		event = {
			"BufReadPre " .. vim.fn.expand("~") .. "/notes/*.md",
			"BufNewFile " .. vim.fn.expand("~") .. "/notes/*.md",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			scroll_sync = true,
		},
	},
}
