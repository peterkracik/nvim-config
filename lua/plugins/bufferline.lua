require('bufferline').setup({
  options = {
    view = "default",
   --mappings = true,
    close_icon = "",
    --close_command = "Bdelete! %d",
    max_name_length = 30,
    max_prefix_length = 30,
    --indicator_icon = " ",
    tab_size = 21,
    persist_buffer_sort = true,
    show_buffer_close_icons = true,
    separator_style = "thin",
    always_show_bufferline = true,
    enforce_regular_tabs = true,
    offsets = {{
      fileType = "NvimTree",
      text = "",
      padding = 1,
    }}
  }
})
