if not vim.g.vscode then
    require("core/keymaps")
    require("core/autocmd")
    require("core/lazynvim")
    require("core/options")
else
    require("core/vscode")
end
