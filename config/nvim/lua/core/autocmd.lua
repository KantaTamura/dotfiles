-- when opening a file, restore cursor location
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
	pattern = { "*" },
	callback = function()
		vim.api.nvim_exec('silent! normal! g`"zv', false)
	end,
})
-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--     buffer = buffer,
--     callback = function()
--         vim.lsp.buf.format { async = false }
--     end
-- })
local ar_grp = vim.api.nvim_create_augroup("AutoRead", { clear = true })
vim.api.nvim_create_autocmd(
	{ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI", "TermClose", "TermLeave" },
	{ group = ar_grp, command = "checktime" }
)
