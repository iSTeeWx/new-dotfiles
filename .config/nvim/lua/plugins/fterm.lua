return {
  "numToStr/FTerm.nvim",
  keys = {
    { mode = { "n", "t" }, "<f11>", function() require("FTerm").toggle() end, desc = "Toggles the floating terminal" },
    { mode = { "n", "t" }, "<f10>", function() require("FTerm").toggle() end, desc = "Toggles the floating terminal" },
  },
}
