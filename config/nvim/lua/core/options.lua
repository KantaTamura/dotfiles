-- line
--  行番号を表示し相対表示する
--  signcolumnを常に表示する
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.signcolumn     = 'yes'

-- backup
--  バックアップファイルを作成しない
--  アンドゥファイルを作成する
vim.opt.backup         = false
vim.opt.swapfile       = false
vim.opt.undofile       = true

-- search
--  検索時にすぐに対象に移動し，ハイライトする
--  検索時に大文字小文字を区別しないが，大文字が含まれている場合は区別する
vim.opt.incsearch      = true
vim.opt.hlsearch       = true
vim.opt.ignorecase     = true
vim.opt.smartcase      = true

-- clipboard
--  neovimのclipboardをシステムのclipboardと同期する
vim.opt.clipboard      = 'unnamedplus'

-- mouse
--  マウスを有効にする
vim.opt.mouse          = 'a'

-- color
--  true colorを有効にする
vim.opt.termguicolors  = true

-- time
--  タイムアウトを設定する
vim.opt.updatetime     = 250
vim.opt.timeout        = true
vim.opt.timeoutlen     = 300

-- indent
vim.opt.autoindent     = true
vim.opt.breakindent    = true

-- tab
vim.opt.expandtab      = false
vim.opt.tabstop        = 4
vim.opt.shiftwidth     = 4

-- vim doc
vim.opt.helplang       = "ja,en"

-- file
--  ファイルが外部で変更された場合に自動で読み込む
vim.opt.autoread       = true

-- statusline
--  ステータスラインを常に表示する
vim.opt.laststatus     = 2

-- complete
--  補完メニューを表示し，挿入を行わない
vim.opt.completeopt    = { 'menuone', 'noinsert' }

-- split
--  分割したウィンドウを右側に表示する
vim.opt.splitright     = true
