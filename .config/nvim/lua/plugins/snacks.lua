return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      picker = {
        layout = { preset = "telescope" },
      },
      terminal = {},
      notifier = {
        style = "compact",
      },
      notify = {},
    },
    keys = {
      { "<leader><space>", function() Snacks.picker.recent() end, desc = "Recent Files" },
      { "<leader>s", function() Snacks.picker.grep() end, desc = "Grep" },
      { "<leader>q", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
      { "gd", function() Snacks.picker.lsp_definitions() end, desc = "[G]oto [D]efinition" },
      { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "[G]oto [R]eferences" },
      { "<F11>", mode = { "n", "t" }, function() Snacks.terminal.toggle("zsh") end, desc = "Floating terminal" },
    },
  },
}
