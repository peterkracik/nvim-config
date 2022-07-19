local wk = require("which-key")
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '


-- basic
wk.register({
  ["Y"] = { 'y$', 'Copy to the end of line' },
  ["<S-C-p>"] = { '"0p', 'Copy to clipboard' },
  ["d"] = { '"_d', 'Delete witout yanking' },
  ["x"] = { '"_x', 'Delete character witout yanking' },
  ["<S>"] = {
    -- search
    h = { ':%s//gc<left><left><left>', 'Search and replace' },
  },
  ["<C>"] = {
    -- select all
    a = { "gg<S-v>G", 'Select all' },
  }
})

-- moving text
wk.register({
  ["<leader>"] = {
    name = "Move text",
    j = { ":m .+1<CR>==", 'Move current line one line down' },
    k = { ":m .-2<CR>==", 'Move current line one line up' },
  },
  ["<C>"] = {
    j = { "<esc>:m .+1<CR>==a", 'Move current one line down', mode=i },
    k = { "<esc>:m .-2<CR>==a", 'Move current one line up', mode=i },
  },
  ["<S>"] = {
    j = { "<esc>:m .+1<CR>gv=gv", 'Move current one line down', mode=v },
    k = { "<esc>:m .-2<CR>gv=gv", 'Move current one line up', mode=v },
  }
})


-- buffers
wk.register({
  ["<C>"] = {
    name = "Buffers",
    ["["] = { ':bp<CR>', 'Previous buffer' },
    ["]"] = { ':bn<CR>', 'Next buffer' },
  },
  ["<leader>"] = {
    name = "Buffers",
    q = { ':bw<CR>', 'Close current buffer' },
  }
})

-- NvimTree
wk.register({
  ["<S-Tab>"] = { ':NvimTreeFindFileToggle<CR>', 'Focus Tree' }
})

-- telescope
wk.register({
  [";"] = {
    name = "Telescope",
    f = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Find file"},
    g = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Grep files"},
    h = { "<cmd>lua require('telescope.builtin').help_tags()<cr>", "Help tags"},
    d = { "<cmd>lua require('telescope.builtin').diagnostics()<cr>", "Diagnostics"},
    ["\\"] = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "Find buffers"},

  }
})

-- lsp - loaded inside the plugin
require('mappings.lsp')
