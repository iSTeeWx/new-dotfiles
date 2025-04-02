return {
  {
    'stevearc/oil.nvim',
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    opts = {
      float = {
        padding = 0,
        max_width = 0.3,
        max_height = 0.4,
      },
      keymaps = {
        [ "<bs>" ] = "actions.parent",
        [ "<esc>" ] = function () require("oil").close() end,
        [ "q" ] = function () require("oil").close() end,
      },
    },
    keys = {
      { "<leader>e", function () require('oil').toggle_float() end, desc = "Toggles the file manager" },
    },
  }
}
