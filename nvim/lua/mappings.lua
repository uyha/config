local map = require 'utils'.map
map('', '<leader>y', '"+y')
map('', '<leader>p', '"+p')

map('', '<C-n>', ':NvimTreeToggle<CR>')
map('', '<M-`>', ':15sp term://pwsh<CR>')
map('', '<M-->', ':resize -5<CR>')
map('', '<M-=>', ':resize +5<CR>')
map('', '<M-,>', ':vertical resize -5<CR>')
map('', '<M-.>', ':vertical resize +5<CR>')

map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', {expr = true})
map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
map('i', '<C-e>', "<Plug>(completion_trigger)", {silent = true, noremap = false})

map('t', '<Esc>', '<C-\\><C-n>') -- Make escape works in terminal emulator
