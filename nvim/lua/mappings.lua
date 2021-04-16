local map = require 'utils'.map
map('', '<leader>y', '"+y')
map('', '<leader>d', '"+d')
map('', '<leader>p', '"+p')

map('', '<C-n>', ':NvimTreeToggle<CR>')

map('', '<M-`>', ':15sp term://pwsh<CR>')

-- Windows movements
map('', '<leader>-', ':resize -5<CR>')
map('', '<leader>=', ':resize +5<CR>')
map('', '<leader>,', ':vertical resize -5<CR>')
map('', '<leader>.', ':vertical resize +5<CR>')

map('', '<leader>h', '<C-w>h')
map('', '<leader>j', '<C-w>j')
map('', '<leader>k', '<C-w>k')
map('', '<leader>l', '<C-w>l')

map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', {expr = true})
map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
map('i', '<C-k>', "<Plug>(completion_trigger)", {silent = true, noremap = false})

map('t', '<Esc>', '<C-\\><C-n>') -- Make escape works in terminal emulator

-- telescope.vim
map('', '<leader>ff', '<cmd> Telescope find_files<cr>')
map('', '<leader>fg', '<cmd> Telescope live_grep<cr>')
map('', '<leader>fb', '<cmd> Telescope buffers<cr>')
map('', '<leader>fh', '<cmd> Telescope help_tags<cr>')
