local map = require("utils").map
opt = { silent = true }

map("", "<leader>y", '"+y', opt)
map("", "<leader>p", '"+p', opt)

map("", "<C-n>", ":NvimTreeToggle<CR>", opt)

-- Windows movements
map("", "<leader>-", ":resize -5<CR>", opt)
map("", "<leader>=", ":resize +5<CR>", opt)
map("", "<leader>,", ":vertical resize -5<CR>", opt)
map("", "<leader>.", ":vertical resize +5<CR>", opt)

map("", "<C-h>", "<C-w>h", opt)
map("", "<C-j>", "<C-w>j", opt)
map("", "<C-k>", "<C-w>k", opt)
map("", "<C-l>", "<C-w>l", opt)

-- Make escape works in terminal emulator
map("t", "<Esc>", "<C-\\><C-n>", opt)

-- telescope.vim
map("", "<leader>ff", "<cmd> Telescope find_files<cr>", opt)
map("", "<leader>fg", "<cmd> Telescope live_grep<cr>", opt)
map("", "<leader>fb", "<cmd> Telescope buffers<cr>", opt)
map("", "<leader>fh", "<cmd> Telescope help_tags<cr>", opt)

-- neoformat
map(
  "",
  "<leader>F",
  "<cmd> try | undojoin | Neoformat | catch /^Vim%((\a+))=:E790/ | finally | silent Neoformat | endtry<cr>",
  opt
)

map("", "<leader>g", "<cmd>tabnew +0G<cr>", opt)

-- bufferline.nvim
map("", "<leader>[", ":BufferLineCyclePrev<CR>", opt)
map("", "<leader>]", ":BufferLineCycleNext<CR>", opt)
