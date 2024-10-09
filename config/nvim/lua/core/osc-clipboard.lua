vim.cmd([[
let g:clipboard = {
  \   'name': 'osc-copy',
  \   'copy': {
  \      '+': 'osc copy',
  \      '*': 'osc copy',
  \    },
  \   'paste': {
  \      '+': 'osc paste',
  \      '*': 'osc paste',
  \   },
  \   'cache_enabled': 0,
  \ }
]])
