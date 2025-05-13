return {
  "nvim-lualine/lualine.nvim",
  opts = {
    sections = {
      lualine_b = { "diff", "diagnostics" },
      lualine_x = { "filetype" },
    },
    tabline = {
      lualine_c = {
        {
          "buffers",
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          use_mode_colors = true,
          symbols = { alternate_file = "", },
        },
      },
    },
  },
}
