local map = require("utils").map
map("", "<leader>y", '"+y')
map("", "<leader>p", '"+p')

map("", "<C-n>", ":NvimTreeToggle<CR>")

-- Windows movements
map("", "<leader>-", ":resize -5<CR>")
map("", "<leader>=", ":resize +5<CR>")
map("", "<leader>,", ":vertical resize -5<CR>")
map("", "<leader>.", ":vertical resize +5<CR>")

map("", "<C-h>", "<C-w>h")
map("", "<C-j>", "<C-w>j")
map("", "<C-k>", "<C-w>k")
map("", "<C-l>", "<C-w>l")

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

