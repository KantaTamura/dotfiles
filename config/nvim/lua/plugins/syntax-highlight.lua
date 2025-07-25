return {
	{
		-- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		build = ":TSUpdate",
		cmd = { "TSUpdateSync" },
		cond = true,
		opts = {
			ensure_installed = {
				"go",
				"gosum",
				"gomod",
				"gowork",
				"lua",
				"python",
				"rust",
				"typescript",
				"tsx",
				"vimdoc",
				"vim",
				"kotlin",
				"dockerfile",
				"json",
				"json5",
				"jsonc",
				"terraform",
				"hcl",
				"bash",
				"c",
				"html",
				"javascript",
				"jsdoc",
				"luadoc",
				"luap",
				"markdown",
				"markdown_inline",
				"query",
				"regex",
				"yaml",
				"zig",
				"bibtex",
				"latex",
			},
			-- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<c-space>",
					node_incremental = "<c-space>",
					scope_incremental = "<c-s>",
					node_decremental = "<M-space>",
				},
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
			-- Diagnostic keymaps
			vim.keymap.set("n", "[d", function ()
				vim.diagnostic.jump({ count = -vim.v.count1, float = true })
			end, { desc = "Go to previous diagnostic message", silent = true })
			vim.keymap.set("n", "]d", function ()
				vim.diagnostic.jump({ count =  vim.v.count1, float = true })
			end, { desc = "Go to next diagnostic message", silent = true })
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
			vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
		end
	},
	{
		"nvim-treesitter/nvim-treesitter-refactor",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		event = { "BufReadPost", "BufNewFile" },
	}
}
