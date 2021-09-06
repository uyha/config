local map = require("utils").map
map("", "<leader>y", '"+y')
map("", "<leader>p", '"+p')

map("", "<C-n>", ":NvimTreeToggle<CR>")

-- Windows movements
map("", "<leader>-", ":resize -5<CR>")
map("", "<leader>=", ":resize +5<CR>")
map("", "<leader>,", ":vertical resize -5<CR>")
map("", "<leader>.", ":vertical resize +5<CR>")

map("", "<leader><leader>h", "<C-w>h")
map("", "<leader><leader>j", "<C-w>j")
map("", "<leader><leader>k", "<C-w>k")
map("", "<leader><leader>l", "<C-w>l")

map("", "<leader><leader>H", "<C-w>H")
map("", "<leader><leader>J", "<C-w>J")
map("", "<leader><leader>K", "<C-w>K")
map("", "<leader><leader>L", "<C-w>L")
map("", "<leader><leader>r", "<C-w>r")
map("", "<leader><leader>R", "<C-w>R")

-- Make escape works in terminal emulator
map("t", "<Esc>", "<C-\\><C-n>")

-- telescope.vim
map("", "<leader>ff", "<cmd> Telescope find_files<cr>")
map("", "<leader>fg", "<cmd> Telescope live_grep<cr>")
map("", "<leader>fb", "<cmd> Telescope buffers<cr>")
map("", "<leader>fh", "<cmd> Telescope help_tags<cr>")

-- neoformat
map(
  "",
  "<leader>F",
  "<cmd> try | undojoin | Neoformat | catch /^Vim%((\a+))=:E790/ | finally | silent Neoformat | endtry<cr>"
)

-- nvim-compe
map("i", "<C-k>", [[compe#complete()]], { silent = true, expr = true })
map("i", "<CR>", [[compe#confirm('<CR>')]], { silent = true, expr = true })
map("i", "<C-e>", [[compe#close('<C-e>')]], { silent = true, expr = true })
map("i", "<C-f>", [[compe#scroll({ 'delta': +4 })]], { silent = true, expr = true })
map("i", "<C-d>", [[compe#scroll({ 'delta': -4 })]], { silent = true, expr = true })
map("i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true })
map("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true })
