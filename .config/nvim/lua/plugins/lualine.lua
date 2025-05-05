return {
  "nvim-lualine/lualine.nvim",
  opts = {
    sections = {
      lualine_b = { "diff", "diagnostics" },
      lualine_c = {
      },
      lualine_x = {
        {
          "buffers",
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          use_mode_colors = true,
          symbols = { alternate_file = "", },
        },
        "filetype"
      },
    }
  }
}
