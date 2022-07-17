local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '


-- copy line
map('n', 'Y', 'y$', opts)
map('n', '<S-C-p>', '"0p', opts)

-- delete without yunk
map('n', 'd', '"_d', opts)
map('n', 'x', '"_x', opts)

-- Search
map('n', 'H', ':%s//gc<left><left><left>', opts)

-- moving text
map('v', 'J', ":m '>+1<CR>gv=gv", opts)
map('v', 'K', ":m '>-2<CR>gv=gv", opts)
map('i', '<C-j>', "<esc>:m .+1<CR>==a", opts)
map('i', '<C-k>', "<esc>:m .-2<CR>==a", opts)
map('n', '<leader>j', ":m .+1<CR>==", opts)
map('n', '<leader>k', ":m .-2<CR>==", opts)

-- select all
map('n', '<C-a>', 'gg<S-v>G', opts)

-- buffers
map('n', '<leader>[', ':bp<CR>', opts)
map('n', '<leader>]', ':bn<CR>', opts)
map('n', '|', ':bp<CR>', opts)
map('n', '<leader>q', ':bw<CR>', opts)

-- NvimTree
map('n', '<S-Tab>', ':NvimTreeToggle<CR>', opts)

-- telescope
map('n', ';f', "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
map('n', ';g', "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
map('n', "\\", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
map('n', ';h', "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
map('n', ';d', "<cmd>lua require('telescope.builtin').diagnostics()<cr>", opts)

-- lsp
require('mappings.ls-config')
