local g = vim.g

g.rainbow_active = true
g.mapleader = ' '
g.completion_enable_snippet = 'UltiSnips'
g.python3_host_prog = '/home/uy/.cache/pypoetry/virtualenvs/poetry-plqE9lAS-py3.8/bin/python'

-- UltiSnips
g.UltiSnipsExpandTrigger = '<c-e>'
g.UltiSnipsSnippetDirectories = {"ultisnippets"}

-- vim-closetag
g.closetag_filenames = '*.xml'
g.closetag_filetypes = '*.xml'

g.nvim_tree_auto_open = 1
