if vim.loader then vim.loader.enable() end

require("core/keymaps")
require("core/autocmd")
require("core/lazynvim")
require("core/options")

if vim.g.vscode then
	require("core/vscode")
end

if vim.g.neovide then
	require("core/neovide")
end

if vim.fn.has("wsl") == 1 then
	require("core/clipboard-wsl")
elseif os.getenv "SSH_CLIENT" ~= nil or os.getenv "SSH_TTY" ~= nil then
	require("core/clipboard-osc")
end
