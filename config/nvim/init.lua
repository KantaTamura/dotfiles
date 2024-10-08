if vim.loader then vim.loader.enable() end

require("core/keymaps")
require("core/autocmd")
require("core/lazynvim")
require("core/options")

if vim.g.vscode then
    require("core/vscode")
end

if vim.fn.has("wsl") == 1 then
    require("core/wsl-clipboard")
else
    require("core/osc-clipboard")
end
