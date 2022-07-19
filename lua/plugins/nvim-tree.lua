require('nvim-tree').setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      }
    }
  },
  -- auto_close = true,
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
    custom = {
      "^.git$"
    }
  },
  actions = {
    open_file = {
      quit_on_open = true
    }
  }
})
