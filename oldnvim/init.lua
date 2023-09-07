-- lazy.nvim setting
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    'vim-jp/vimdoc-ja',         -- jp help doc
    'cocopon/iceberg.vim',      -- color scheme
    'sainnhe/gruvbox-material', -- color scheme
    { 'neoclide/coc.nvim', branch='release' },
    'junegunn/fzf',             -- search
    'lambdalisue/fern.vim',     -- filer
    'nvim-treesitter/nvim-treesitter',  -- syntax highlight
    'cohama/lexima.vim',        -- bracket
    'w0rp/ale',                 -- lint
    'airblade/vim-gitgutter',   -- git diff
    'tpope/vim-fugitive',       -- git
    { 'nvim-telescope/telescope.nvim', tag = '0.1.2' }, -- fuzzy finder
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },
    "nvim-telescope/telescope-ui-select.nvim",
})

-- option
vim.opt.number          = true
vim.opt.relativenumber  = true
vim.opt.updatetime      = 500
vim.opt.autoindent      = true
vim.opt.expandtab       = true
vim.opt.splitright      = true
vim.opt.hls             = true
vim.opt.tabstop         = 4
vim.opt.shiftwidth      = 4
vim.opt.mouse           = 'a'
vim.opt.clipboard       = { 'unnamed', 'unnamedplus' }
vim.opt.helplang        = { 'ja', 'en' }
vim.opt.signcolumn      = 'yes'
vim.opt.completeopt     = { 'menuone', 'noinsert' }
vim.opt.termguicolors = true

vim.g.python3_host_prog = '/usr/bin/python3'
vim.g.python_host_prog  = '/usr/bin/python'

-- map prefix
vim.g.mapleader = ' '
vim.keymap.set({ 'n', 'x' }, '<Space>', '<Nop>')
vim.keymap.set({ 'n', 'x' }, '<Plug>(lsp)', '<Nop>')
vim.keymap.set({ 'n', 'x' }, 'm', '<Plug>(lsp)')
vim.keymap.set({ 'n', 'x' }, '<Plug>(ff)', '<Nop>')
vim.keymap.set({ 'n', 'x' }, ';', '<Plug>(ff)')

vim.keymap.set({ 'i' }, '<Enter>', 'coc#pum#visible() ? coc#pum#confirm() : "<Enter>"', { expr = true })
vim.keymap.set({ 'i' }, '<Tab>', 'coc#pum#visible() ? coc#pum#confirm() : "<Tab>"', { expr = true })
vim.keymap.set({ 'i' }, '<C-n>', 'coc#pum#visible() ? coc#pum#next(0) : "<C-n>"', { expr = true })
vim.keymap.set({ 'i' }, '<C-p>', 'coc#pum#visible() ? coc#pum#prev(0) : "<C-p>"', { expr = true })

-- coc.nvim
vim.keymap.set({ 'n' }, '<Plug>(lsp)rn', '<Plug>(coc-rename)')
vim.keymap.set({ 'n' }, '<Plug>(lsp)a',  '<Plug>(coc-codeaction-cursor)')

-- fern.vim
vim.keymap.set({ 'n' }, '<Leader>e', '<Cmd>Fern . -drawer<CR>')
vim.keymap.set({ 'n' }, '<Leader>E', '<Cmd>Fern . -drawer -reveal=%<CR>')

-- fzf-preview
vim.keymap.set({ 'n' }, '<Plug>(ff)r',  '<Cmd>CocCommand fzf-preview.ProjectFiles<CR>')
vim.keymap.set({ 'n' }, '<Plug>(ff)s',  '<Cmd>CocCommand fzf-preview.GitStatus<CR>')
vim.keymap.set({ 'n' }, '<Plug>(ff)gg', '<Cmd>CocCommand fzf-preview.GitActions<CR>')
vim.keymap.set({ 'n' }, '<Plug>(ff)b',  '<Cmd>CocCommand fzf-preview.Buffers<CR>')
vim.keymap.set({ 'n' }, '<Plug>(ff)f',  ':<C-u>CocCommand fzf-preview.ProjectGrep --add-fzf-arg=--exact --add-fzf-arg=--no-sort<Space>')

vim.keymap.set({ 'n' }, '<Plug>(lsp)q',  '<Cmd>CocCommand fzf-preview.CocCurrentDiagnostics<CR>')
vim.keymap.set({ 'n' }, '<Plug>(lsp)rf', '<Cmd>CocCommand fzf-preview.CocReferences<CR>')
vim.keymap.set({ 'n' }, '<Plug>(lsp)d',  '<Cmd>CocCommand fzf-preview.CocDefinition<CR>')
vim.keymap.set({ 'n' }, '<Plug>(lsp)t',  '<Cmd>CocCommand fzf-preview.CocTypeDefinition<CR>')
vim.keymap.set({ 'n' }, '<Plug>(lsp)o',  '<Cmd>CocCommand fzf-preview.CocOutline --add-fzf-arg=--exact --add-fzf-arg=--no-sort<CR>')

-- treesitter
require('nvim-treesitter.configs').setup({
    ensure_installed = {
        'bash', 'fish', 'c', 'cpp', 'cmake', 'gitignore',
        'go', 'lua', 'markdown', 'rust', 'zig', "json",
    },
    highlight = {
        enable = true,
    },
})

-- color scheme
vim.cmd.colorscheme('iceberg')
