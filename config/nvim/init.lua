if vim.g.vscode then
    require('core/vscode')
else
    require('core/keymaps')
    require('core/autocmd')
    require('core/lazynvim')
    require('core/options')
end
