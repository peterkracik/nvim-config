local wk = require("which-key")
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '


-- basic
wk.register({
  ["<leader>"] = {
    p = { "\"_dP", 'Paste without putting to register' },
    d = { "\"_d", 'Delete witout yanking' },
  },
  ["Y"] = { 'y$', 'Copy to the end of line' },
  -- ["<leader>p"] = { '"_dP', 'Paste without putting to register' },
  ["<S-C-d>"] = { '"0p', 'Copy to clipboard' },
  -- ["<leader>d"] = { '"_d', 'Delete witout yanking' },
  ["x"] = { '"_x', 'Delete character witout yanking' },
  ["H"] = { ':%s//gc<left><left><left>', 'Search and replace' },
  ["<C-a>"] ={ "gg<S-v>G", 'Select all' },
})

-- test1 test1 test2 

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


-- floaterm
wk.register({
  t = {
    name = "+Terminal",
    [";"] = { ":FloatermNew --wintype=popup --height=6 <CR>", "New terminal" },
    t = { ":FloatermToggle <CR>", "Terminal" },
    g = { ":FloatermNew lazygit <CR>", "git" },
    r = { ":FloatermNew ranger <CR>", "ranger" },
    h = { ":FloatermHide <CR>", "Hide terminal" },
  }
})

-- Devcontainer
-- wk.register({
--   d = {
--     name = "+Devcontainer",
--     a = { ":AttachToContainer <CR>", "Attach to container" }, 
--     b = { ":BuildImage true<CR>", "Build Image" },
--     s = { ":StartImage <CR>", "Start Image" },
--     u = { ":ComposeUp <CR>", "Compose up" },
--     q = { ":ComposeDown <CR>", "Compose down" },
--     r = { ":ComposeDestroy <CR>", "Compose destroy" },
--   }
-- }, { prefix = "<leader>" })

-- NvimTree
-- nt_api = require("nvim-tree.api")
-- wk.register({
--   m = {
--     name = "+NvimTree Bookmarks",
--     n = {nt_api.marks.navigate.next, "Next bookmark" },
--     p = {nt_api.marks.navigate.prev, "Previous bookmark" },
--     s = {nt_api.marks.navigate.select, "Select bookmark" },
--   } 
-- }, {prefix = "<leader>"})
