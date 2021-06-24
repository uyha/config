local opt = require'utils'.opt
local indent = 2
local width = 120

opt('b', 'expandtab', true)                           -- Use spaces instead of tabs
opt('b', 'formatoptions', 'crqnj')                    -- Automatic formatting options
opt('b', 'shiftwidth', indent)                        -- Size of an indent
opt('b', 'smartindent', true)                         -- Insert indents automatically
opt('b', 'tabstop', indent)                           -- Number of spaces tabs count for
opt('b', 'textwidth', width)                          -- Maximum width of text

opt('o', 'completeopt', 'menuone,noinsert,noselect')  -- Completion options
opt('o', 'guifont', 'Comic Code:b')                   -- Use Comic Code font
opt('o', 'hidden', true)                              -- Enable background buffers
opt('o', 'ignorecase', true)                          -- Ignore case
opt('o', 'joinspaces', false)                         -- No double spaces with join
opt('o', 'mouse', 'a')                                -- Enable mouse scrolling
opt('o', 'pastetoggle', '<F2>')                       -- Paste mode
opt('o', 'scrolloff', 4 )                             -- Lines of context
opt('o', 'shiftround', true)                          -- Round indent
opt('o', 'shortmess', vim.o.shortmess .. 'c')         -- Don't insert completion menu
opt('o', 'sidescrolloff', 8 )                         -- Columns of context
opt('o', 'smartcase', true)                           -- Don't ignore case with capitals
opt('o', 'splitbelow', true)                          -- Put new windows below current
opt('o', 'splitright', true)                          -- Put new windows right of current
opt('o', 'termguicolors', true)                       -- True color support
opt('o', 'updatetime', 200)                           -- Delay before swap file is saved
opt('o', 'virtualedit', 'all')                        -- Allow cursor more than actual line length
opt('o', 'wildmode', 'list:longest')                  -- Command-line completion mode

opt('w', 'colorcolumn', tostring(width))              -- Line length marker
opt('w', 'foldmethod', 'expr')                        -- Set foldmethod in order to use `nvim-treesitter` folding
opt('w', 'foldexpr', 'nvim_treesitter#foldexpr()')    -- Use nvim-treesitter folding
opt('w', 'cursorline', true)                          -- Highlight cursor line
opt('w', 'list', true)                                -- Show some invisible characters
opt('w', 'number', true)                              -- Show line numbers
opt('w', 'relativenumber', true)                      -- Relative line numbers
opt('w', 'signcolumn', 'yes')                         -- Show sign column
opt('w', 'wrap', false)                               -- Disable line wrap
