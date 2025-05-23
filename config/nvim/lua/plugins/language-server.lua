return {
	{
		-- link lspclient and nvim-cmp
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		lazy = true,
		opts = {
			{
				float_border = "rounded",
				call_servers = "local",
				configure_diagnostics = true,
				setup_servers_on_start = true,
				set_lsp_keymaps = {
					preserve_mappings = false,
					omit = {},
				},
				manage_nvim_cmp = {
					set_sources = "recommended",
					set_basic_mappings = true,
					set_extra_mappings = false,
					use_luasnip = true,
					set_format = true,
					documentation_window = true,
				},
			}
		},
		config = function(_, opts)
			-- This is where you modify the settings for lsp-zero
			-- Note: autocompletion settings will not take effect
			require("lsp-zero.settings").preset(opts)
		end
	},
	{
		-- complement
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{ "L3MON4D3/LuaSnip" },
			{ "hrsh7th/cmp-path" },
			{ "zbirenbaum/copilot.lua" },
			{ "onsails/lspkind.nvim" },
		},
		config = function()
			-- Here is where you configure the autocompletion settings.
			-- The arguments for .extend() have the same shape as `manage_nvim_cmp`:
			-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/api-reference.md#manage_nvim_cmp

			require("lsp-zero.cmp").extend()

			-- And you can configure cmp even more, if you want to.
			local cmp = require("cmp")
			local cmp_action = require("lsp-zero.cmp").action()
			local lspkind = require('lspkind')

			lspkind.init({
				symbol_map = {
					Copilot = "",
				},
			})

			vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })

			cmp.setup({
				sources = {
					{ name = "copilot",  group_index = 2 },
					{ name = "nvim_lsp", group_index = 2 },
					{ name = "luasnip",  group_index = 2 },
					{ name = "path",     group_index = 2 },
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = {
					["<CR>"] = cmp.mapping.confirm({ select = false }),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-f>"] = cmp_action.luasnip_jump_forward(),
					["<C-b>"] = cmp_action.luasnip_jump_backward(),
				},
				completion = {
					completeopt = "menu,menuone,preview,noselect"
				},
				formatting = {
					fields = { "abbr", "kind", "menu" },
					format = lspkind.cmp_format({
						mode = "symbol",
						max_width = 50,
						symbol_map = { Copilot = "" }
					})
				},
			})

			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "cmdline" },
				},
			})
		end
	},
	{
		-- language server client
		"neovim/nvim-lspconfig",
		cmd = "LspInfo",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "williamboman/mason.nvim" },
			{ "nvim-lua/plenary.nvim" },

			-- null-ls
			{ "nvimtools/none-ls.nvim" },
			{ "jay-babu/mason-null-ls.nvim" },
		},
		config = function()
			-- This is where all the LSP shenanigans will live

			local lsp = require("lsp-zero")
			lsp.ensure_installed({
				"gopls",
				"marksman",
				"lua_ls",
				"rust_analyzer",
				"zls",
				"graphql",
				"ruff",
				"clangd",
				"texlab",
				"nil_ls",
				"biome",
			})

			lsp.set_sign_icons({
				error = "✘",
				warn = "▲",
				hint = "⚑",
				info = "»"
			})

			lsp.on_attach(function(client, bufnr)
				-- see :help lsp-zero-keybindings
				-- to learn the available actions
				lsp.default_keymaps({ buffer = bufnr })
				vim.keymap.set("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>")
				vim.keymap.set("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>")
			end)

			lsp.format_on_save({
				format_opts = {
					async = true,
					timeout_ms = 10000,
				},
				servers = {
					["gopls"] = { "go" },
					["lua_ls"] = { "lua" },
					["rust_analyzer"] = { "rust" },
					["zls"] = { "zig" },
					["ruff"] = { "python" },
					["clangd"] = { "c", "c++" },
					["texlab"] = { "tex" },
					["nil_ls"] = { "nix" },
					["biome"] = { "typescript" },
				}
			})

			-- (Optional) Configure lua language server for neovim
			require("lspconfig").gopls.setup({
				on_attach = function(client, bufnr)
					print("hello gopls")
					vim.api.nvim_create_autocmd("BufWritePre", {
						pattern = "*.go",
						callback = function()
							vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
						end
					})
				end,
				settings = {
					gopls = {
						-- analyses = {
						--   unusedparams = true,
						-- },
						-- staticcheck = true,
					},
				}
			})

			require("lspconfig").rust_analyzer.setup({
				on_attach = function(client, bufnr)
					vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
				end,
				settings = {
					["rust_analyzer"] = {
						imports = {
							granularity = {
								group = "module",
							},
							prefix = "self",
						},
						cargo = {
							buildScripts = {
								enable = true,
							},
						},
						procMacro = {
							enable = true,
						},
						checkOnSave = {
							command = "clippy",
							extraArgs = { "--all", "--", "-W", "clippy::all" },
						},
					},
				},
			})

			require("lspconfig").clangd.setup({
				settings = {
					cmd = { "clangd", "--background-index", "--clang-tidy" },
				}
			})

			require("lspconfig").nil_ls.setup({
				settings = {
					['nil'] = {
						formatting = {
							command = { "nixfmt" },
						},
					},
				},
			})

			lsp.setup()

			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					-- Replace these with the tools you have installed
					-- make sure the source name is supported by null-ls
					-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
					-- null_ls.builtins.diagnostics.cspell.with({
					--     method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
					--     diagnostics_postprocess = function(diagnostic)
					--         -- レベルをWARNに変更（デフォルトはERROR）
					--         diagnostic.severity = vim.diagnostic.severity["WARN"]
					--     end,
					--     -- 起動時に設定ファイル読み込み
					--     extra_args = { "--config", "~/.config/cspell/cspell.json" },
					-- }),
					null_ls.builtins.formatting.clang_format,
				}
			})
			-- See mason-null-ls.nvim"s documentation for more details:
			-- https://github.com/jay-babu/mason-null-ls.nvim#setup
			require("mason-null-ls").setup({
				ensure_installed = {
					"stylua",
					"gofumpt",
					"golangci_lint",
					"clang-format",
					"prettier",
					"markdownlint-cli2",
					"textlint",
					"cspell",
				},
				automatic_installation = true,
			})
		end
	},
	{
		"nvimdev/lspsaga.nvim",
		-- cond = false,
		event = { "BufReadPre", "BufNewFile" },
		cond = function()
			return not vim.g.vscode
		end,
		config = function()
			require("lspsaga").setup({
				ui = {
					title = false,
					border = "single",
				},
				symbol_in_winbar = {
					enable = true,
					priority = 1000,
				},
				code_action_lightbulb = {
					enable = true,
				},
				show_outline = {
					win_width = 50,
					auto_preview = false,
				},
			})

			local keymap = vim.keymap.set
			-- LSP finder - Find the symbol's definition
			-- If there is no definition, it will instead be hidden
			-- When you use an action in finder like "open vsplit",
			-- you can use <C-t> to jump back
			keymap("n", "gh", "<cmd>Lspsaga finder<CR>")

			keymap({ "n", "v" }, "ga", "<cmd>Lspsaga code_action<CR>")

			-- Peek definition
			-- You can edit the file containing the definition in the floating window
			-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
			-- It also supports tagstack
			-- Use <C-t> to jump back
			keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>")

			-- Go to definition
			-- keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>")

			-- Show line diagnostics
			-- You can pass argument ++unfocus to
			-- unfocus the show_line_diagnostics floating window
			keymap("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")

			-- Show buffer diagnostics
			keymap("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")

			-- Show workspace diagnostics
			keymap("n", "<leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>")

			-- Show cursor diagnostics
			keymap("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")

			-- Diagnostic jump
			-- You can use <C-o> to jump back to your previous location
			keymap("n", "g]", "<cmd>Lspsaga diagnostic_jump_next<CR>")
			keymap("n", "g[", "<cmd>Lspsaga diagnostic_jump_prev<CR>")

			-- Toggle outline
			keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>")

			-- Hover Doc
			-- If there is no hover doc,
			-- there will be a notification stating that
			-- there is no information available.
			-- To disable it just use ":Lspsaga hover_doc ++quiet"
			-- Pressing the key twice will enter the hover window
			keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")

			-- If you want to keep the hover window in the top right hand corner,
			-- you can pass the ++keep argument
			-- Note that if you use hover with ++keep, pressing this key again will
			-- close the hover window. If you want to jump to the hover window
			-- you should use the wincmd command "<C-w>w"
			keymap("n", "K", "<cmd>Lspsaga hover_doc ++keep<CR>")

			-- Call hierarchy
			keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
			keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")

			-- keymap("n", "<Leader>t", "<cmd>Lspsaga term_toggle<CR>")
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "InsertEnter",
		config = function()
			local cfg = {} -- add your config here
			require "lsp_signature".setup(cfg)
		end
	},
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		event = "LspAttach",
		opts = {
			-- options
		},
	},
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "LspAttach",
		priority = 1000, -- needs to be loaded in first
		config = function()
			require('tiny-inline-diagnostic').setup()
			vim.diagnostic.config({ virtual_text = false }) -- Only if needed in your configuration, if you already have native LSP diagnostics
		end
	},
}
