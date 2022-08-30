local M = {}
local wk = require("which-key")
local opts = { noremap = true, silent = true }

-- local keymap = vim.api.nvim_set_keymap
-- local buf_keymap = vim.api.nvim_buf_set_keymap

  -- Key mappings
  -- buf_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  -- keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
  -- keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  -- keymap("n", "[e", "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>", opts)
  -- keymap("n", "]e", "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>", opts)

  wk.register({
    ["["] = {
      name = 'Diagnostics',
      d = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", 'Go to previous' },
      e = { "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>", 'Go to previous error' },
    },
    ["]"] = {
      name = 'Diagnostics',
      d = { "<cmd>lua vim.diagnostic.goto_next()<CR>", 'Go to next' },
      e = { "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>", 'Go to next error' },
    },
    ["K"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", buffer=bufrn}
  })

  -- Whichkey
  --[[ local keymap_l = {
    l = {
      name = "Code",
      r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
      -- '.' ={ "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
      d = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Line Diagnostics" },
      i = { "<cmd>LspInfo<CR>", "Lsp Info" },
    },
  } ]]

  -- if client.resolved_capabilities.document_formatting then
  --   keymap_l.l.f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format Document" }
  -- end

  --[[ local keymap_g = {
    name = "Goto",
    d = { "<Cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
    D = { "<Cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
    s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
    I = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Goto Implementation" },
    t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Goto Type Definition" },
  -- } ]]
  -- keymap('n', 'g.', "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  -- keymap('n', 'gd', "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  -- keymap('n', 'gc', "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  -- keymap('n', 'gs', "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  -- keymap('n', 'gi', "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  -- keymap('n', 'gt', "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  --
  -- keymap('n', 'gr', "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  -- keymap('n', 'K', "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  -- if client.resolved_capabilities.document_formatting then
  --   keymap('n', 'gf', "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  -- end
  -- whichkey.register(keymap_l, { buffer = bufnr, prefix = "<leader>" })
  -- whichkey.register(keymap_g, { buffer = bufnr, prefix = "g" })
  --

  wk.register({
    g = {
      name = "+LSP",
      ["."] = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code action" },
      d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
      c = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
      s = {"<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature help" },
      i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Implementation" },
      t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Type definition" },
      r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
    },
    K = { "<cmd>lua vim.diagnostic.open_float()<CR>", 'View diagnostic' },
    F = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Formatting" },
  })

-- end
--
-- function M.setup(client, bufnr)
--   keymappings(client, bufnr)
-- end
--
-- return M

--[[ local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>.', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>f', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
-- require('lspconfig')['pyright'].setup{
--     on_attach = on_attach,
--     flags = lsp_flags,
-- }
-- require('lspconfig')['tsserver'].setup{
--     on_attach = on_attach,
--     flags = lsp_flags,
-- }
-- require('lspconfig')['rust_analyzer'].setup{
--     on_attach = on_attach,
--     flags = lsp_flags,
--     -- Server-specific settings...
--     settings = {
--       ["rust-analyzer"] = {}
--     }
-- } ]]
